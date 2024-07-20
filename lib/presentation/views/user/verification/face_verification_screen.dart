import 'dart:async';
import 'dart:math';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';
import 'package:online/core/constants/strings.dart';
import 'package:online/presentation/utils/mlkit_utils.dart';
import 'package:online/presentation/views/success/success_screen.dart';
import 'package:online/presentation/widget/stepindicator/stepindicator_widget.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:rxdart/rxdart.dart';

class FaceverificationScreen extends StatefulWidget {
  const FaceverificationScreen({Key? key}) : super(key: key);

  @override
  _FaceverificationScreenState createState() => _FaceverificationScreenState();
}

class _FaceverificationScreenState extends State<FaceverificationScreen> {
  final _faceDetectionController = BehaviorSubject<FaceDetectionModel>();
  Preview? _preview;

  final options = FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  );
  late final faceDetector = FaceDetector(options: options);

  bool _blinkDetected = false;
  bool _mouthOpenDetected = false;
  bool _lookUpDetected = false;
  bool _lookDownDetected = false;

  @override
  void deactivate() {
    faceDetector.close();
    super.deactivate();
  }

  @override
  void dispose() {
    _faceDetectionController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pribadi'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 35),
            StepProgressIndicator(currentStep: 3),
            Expanded(
              child: CameraAwesomeBuilder.previewOnly(
                previewFit: CameraPreviewFit.contain,
                sensorConfig: SensorConfig.single(
                  sensor: Sensor.position(SensorPosition.front),
                  aspectRatio: CameraAspectRatios.ratio_16_9,
                ),
                onImageForAnalysis: (img) => _analyzeImage(img),
                imageAnalysisConfig: AnalysisConfig(
                  androidOptions: const AndroidAnalysisOptions.nv21(
                    width: 1080, // Adjusted width for better face analysis
                  ),
                  maxFramesPerSecond: 5,
                ),
                builder: (state, preview) {
                  _preview = preview;
                  return _MyPreviewDecoratorWidget(
                    cameraState: state,
                    faceDetectionStream: _faceDetectionController,
                    preview: _preview!,
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SuccessScreen()), (route)=> false);
                }, 
                child: Text(AppStrings.berikutnya, style: appTheme.textTheme.labelMedium,))
          ],
        ),
      ),
    );
  }

  Future _analyzeImage(AnalysisImage img) async {
    final inputImage = img.toInputImage();

    try {
      final faces = await faceDetector.processImage(inputImage);

      for (final face in faces) {
        if (_isBlinking(face)) _blinkDetected = true;
        if (_isMouthOpen(face)) _mouthOpenDetected = true;
        if (_isLookingUp(face)) _lookUpDetected = true;
        if (_isLookingDown(face)) _lookDownDetected = true;
      }

      if (_blinkDetected && _mouthOpenDetected && _lookUpDetected && _lookDownDetected) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      }

      _faceDetectionController.add(
        FaceDetectionModel(
          faces: faces,
          absoluteImageSize: inputImage.metadata!.size,
          rotation: 0,
          imageRotation: img.inputImageRotation,
          img: img,
        ),
      );
    } catch (error) {
      debugPrint("...sending image resulted error $error");
    }
  }

  bool _isBlinking(Face face) {
    final leftEyeOpenProbability = face.leftEyeOpenProbability;
    final rightEyeOpenProbability = face.rightEyeOpenProbability;

    return (leftEyeOpenProbability != null && leftEyeOpenProbability < 0.5) &&
           (rightEyeOpenProbability != null && rightEyeOpenProbability < 0.5);
  }

  bool _isMouthOpen(Face face) {
    final mouthOpenProbability = face.smilingProbability;
    return mouthOpenProbability != null && mouthOpenProbability > 0.5;
  }

  bool _isLookingUp(Face face) {
    final headEulerAngleX = face.headEulerAngleX;
    return headEulerAngleX != null && headEulerAngleX < -10;
  }

  bool _isLookingDown(Face face) {
    final headEulerAngleX = face.headEulerAngleX;
    return headEulerAngleX != null && headEulerAngleX > 10;
  }
}

class _MyPreviewDecoratorWidget extends StatelessWidget {
  final CameraState cameraState;
  final Stream<FaceDetectionModel> faceDetectionStream;
  final Preview preview;

  const _MyPreviewDecoratorWidget({
    required this.cameraState,
    required this.faceDetectionStream,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: StreamBuilder(
        stream: cameraState.sensorConfig$,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return StreamBuilder<FaceDetectionModel>(
              stream: faceDetectionStream,
              builder: (_, faceModelSnapshot) {
                if (!faceModelSnapshot.hasData) return const SizedBox();
                final canvasTransformation = faceModelSnapshot.data!.img
                    ?.getCanvasTransformation(preview);
                return CustomPaint(
                  painter: FaceDetectorPainter(
                    model: faceModelSnapshot.requireData,
                    canvasTransformation: canvasTransformation,
                    preview: preview,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FaceDetectorPainter extends CustomPainter {
  final FaceDetectionModel model;
  final CanvasTransformation? canvasTransformation;
  final Preview? preview;

  FaceDetectorPainter({
    required this.model,
    this.canvasTransformation,
    this.preview,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (preview == null || model.img == null) {
      return;
    }
    // We apply the canvas transformation to the canvas so that the barcode
    // rect is drawn in the correct orientation. (Android only)
    if (canvasTransformation != null) {
      canvas.save();
      canvas.applyTransformation(canvasTransformation!, size);
    }
    for (final Face face in model.faces) {
      Map<FaceContourType, Path> paths = {
        for (var fct in FaceContourType.values) fct: Path()
      };
      face.contours.forEach((contourType, faceContour) {
        if (faceContour != null) {
          paths[contourType]!.addPolygon(
              faceContour.points
                  .map(
                    (element) => preview!.convertFromImage(
                      Offset(element.x.toDouble(), element.y.toDouble()),
                      model.img!,
                    ),
                  )
                  .toList(),
              true);
          for (var element in faceContour.points) {
            var position = preview!.convertFromImage(
              Offset(element.x.toDouble(), element.y.toDouble()),
              model.img!,
            );
            canvas.drawCircle(
              position,
              4,
              Paint()..color = Colors.blue,
            );
          }
        }
      });
      paths.removeWhere((key, value) => value.getBounds().isEmpty);
      for (var p in paths.entries) {
        canvas.drawPath(
            p.value,
            Paint()
              ..color = Colors.orange
              ..strokeWidth = 2
              ..style = PaintingStyle.stroke);
      }
    }
    // if you want to draw without canvas transformation, use this:
    if (canvasTransformation != null) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.model != model;
  }
}

extension InputImageRotationConversion on InputImageRotation {
  double toRadians() {
    final degrees = toDegrees();
    return degrees * 2 * pi / 360;
  }

  int toDegrees() {
    switch (this) {
      case InputImageRotation.rotation0deg:
        return 0;
      case InputImageRotation.rotation90deg:
        return 90;
      case InputImageRotation.rotation180deg:
        return 180;
      case InputImageRotation.rotation270deg:
        return 270;
    }
  }
}

class FaceDetectionModel {
  final List<Face> faces;
  final Size absoluteImageSize;
  final int rotation;
  final InputImageRotation imageRotation;
  final AnalysisImage? img;

  FaceDetectionModel({
    required this.faces,
    required this.absoluteImageSize,
    required this.rotation,
    required this.imageRotation,
    this.img,
  });

  Size get croppedSize => img!.croppedSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaceDetectionModel &&
          runtimeType == other.runtimeType &&
          faces == other.faces &&
          absoluteImageSize == other.absoluteImageSize &&
          rotation == other.rotation &&
          imageRotation == other.imageRotation &&
          croppedSize == other.croppedSize;

  @override
  int get hashCode =>
      faces.hashCode ^
      absoluteImageSize.hashCode ^
      rotation.hashCode ^
      imageRotation.hashCode ^
      croppedSize.hashCode;
}
