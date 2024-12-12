import 'dart:io';

class FaceVerificationResponse {
  final String success;
  final String message;
  final FaceVerification? data;

  FaceVerificationResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory FaceVerificationResponse.fromJson(Map<String, dynamic> json) {
    return FaceVerificationResponse(
      success: json['success'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null
          ? FaceVerification.fromJson(json['data'])
          : null,
    );
  }
}
class FaceVerification {
  final File photo;
  final String? createdAt;
  final String? updatedAt;
  final int? id;

  FaceVerification({
    required this.photo,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory FaceVerification.fromJson(Map<String, dynamic> json) {
    // Ensure the photo path is valid before creating the File object
    return FaceVerification(
      photo: File(json['photo']), // Construct File from the path string
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
