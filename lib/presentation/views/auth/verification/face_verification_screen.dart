import 'dart:async';
import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:online/core/networks/api_service.dart';
import 'package:online/core/utils/mlkit_utils.dart';
import 'package:online/presentation/views/success/success_screen.dart';
import 'package:online/presentation/widget/loading/loading_widget.dart';
import 'package:online/presentation/widget/stepindicator/stepindicator_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class FaceverificationScreen extends StatefulWidget {
  const FaceverificationScreen({super.key});

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

  bool _isFaceDetected = false;
  bool _isNavigating = false;
  Timer? _navigationTimer;

  @override
  void deactivate() {
    faceDetector.close();
    super.deactivate();
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _faceDetectionController.close();
    super.dispose();
  }

  Future<bool> uploadPhoto(JpegImage img) async {
    final ApiService apiService = ApiService();
    LoadingWidget.showLoadingDialog(context);

    try {
      final String fileName = '${DateTime.now().toIso8601String()}.jpg';
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/$fileName';

      final File file = File(filePath);
      await file.writeAsBytes(img.bytes);

      final response = await apiService.submitFacePhoto(file);
      if (response.success == "true") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    } finally {
      LoadingWidget.hideloadingDialog(context);
      setState(() {
        _isNavigating = false;
      });
    }
  }

  void _startNavigationTimer(JpegImage img) {
    _navigationTimer?.cancel();
    _navigationTimer = Timer(const Duration(seconds: 10), () async {
      if (mounted && _isFaceDetected) {
        bool isSuccess = await uploadPhoto(img);
        if (isSuccess && mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => SuccessScreen(
                        title: 'Sukses menambahkan data diri',
                        subtitle:
                            'silahkan menunggu untuk informasi selanjutnya',
                      )),
              (route) => false);
        }
      }
    });
  }

  void _stopNavigationTimer() {
    _navigationTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pribadi'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Stack(
          children: [
            const SizedBox(height: 35),
            Positioned.fill(
              child: CameraAwesomeBuilder.previewOnly(
                previewFit: CameraPreviewFit.cover,
                sensorConfig: SensorConfig.single(
                  sensor: Sensor.position(SensorPosition.front),
                  aspectRatio: CameraAspectRatios.ratio_16_9,
                ),
                onImageForAnalysis: (img) async {
                  if (_isNavigating) return;

                  final inputImage = img.toInputImage();
                  final faces = await faceDetector.processImage(inputImage);

                  if (faces.isNotEmpty && !_isFaceDetected) {
                    setState(() {
                      _isFaceDetected = true;
                    });
                    final result =
                        await img.when(nv21: (Nv21Image image) async {
                      final jpegImage = await image.toJpeg();
                      return jpegImage;
                    });
                    if (result != null) {
                      _startNavigationTimer(result);
                    } else {
                      print('Result is Null');
                    }
                  } else if (faces.isEmpty && _isFaceDetected) {
                    setState(() {
                      _isFaceDetected = false;
                    });
                    _stopNavigationTimer();
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
                },
                imageAnalysisConfig: AnalysisConfig(
                  androidOptions: const AndroidAnalysisOptions.nv21(
                    width: 320,
                  ),
                  maxFramesPerSecond: 20,
                ),
                builder: (state, preview) {
                  _preview = preview;
                  return _MyPreviewDecoratorWidget(
                      cameraState: state,
                      faceDetectionStream: _faceDetectionController,
                      preview: _preview!);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: StepProgressIndicator(currentStep: 3),
            ),
          ],
        ),
      ),
    );
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
            true,
          );
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

      for (final path in paths.values) {
        canvas.drawPath(
          path,
          Paint()
            ..strokeWidth = 3
            ..style = PaintingStyle.stroke
            ..color = Colors.blue,
        );
      }
    }

    if (canvasTransformation != null) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaceDetectionModel &&
          runtimeType == other.runtimeType &&
          faces == other.faces &&
          absoluteImageSize == other.absoluteImageSize &&
          rotation == other.rotation &&
          imageRotation == other.imageRotation;

  @override
  int get hashCode =>
      faces.hashCode ^
      absoluteImageSize.hashCode ^
      rotation.hashCode ^
      imageRotation.hashCode;
}
