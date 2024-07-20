import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;

  StepProgressIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStepText('Data\nPribadi', 1),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _buildStepText('Foto\nIdentitas', 2),
              ),
              _buildStepText('Verifikasi\nWajah', 3),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStep(1),
                _buildLine(1),
                _buildStep(2),
                _buildLine(2),
                _buildStep(3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int step) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: currentStep >= step ? Colors.green : Colors.grey[300],
      ),
    );
  }

  Widget _buildLine(int step) {
    return Expanded(
      child: Container(
        height: 4,
        color: currentStep > step ? Colors.green : Colors.grey[300],
      ),
    );
  }

  Widget _buildStepText(String text, int step) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: currentStep >= step ? Colors.green : Colors.grey[300],
      ),
    );
  }
}