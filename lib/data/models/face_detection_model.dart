import 'dart:ui';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

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
}
