import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class ImagepickercardWidget extends StatefulWidget {
  final String? title;
  final Widget icon;
  final File? image;
  final Function() onTap;

  const ImagepickercardWidget(
      {super.key,
      this.image,
      this.title,
      required this.icon,
      required this.onTap});

  @override
  _ImagepickercardWidgetState createState() => _ImagepickercardWidgetState();
}

class _ImagepickercardWidgetState extends State<ImagepickercardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: widget.title != null
                ? Text(
                    widget.title!,
                    style: appTheme.textTheme.titleSmall,
                  )
                : const SizedBox.shrink()),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 152,
            decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            child: widget.image != null
                ? Center(child: Image.file(widget.image! , fit: BoxFit.cover,))
                : Center(
                    child: widget.icon,
                  ),
          ),
        ),
      ],
    );
  }
}
