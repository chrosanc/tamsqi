import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class ImagepickercardWidget extends StatefulWidget {
  final String? title;
  final Widget icon;
  final Function() onTap;
  const ImagepickercardWidget({ Key? key, this.title ,required this.icon, required this.onTap }) : super(key: key);

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
          child:
          widget.title != null ?
           Text(widget.title!, style: appTheme.textTheme.titleSmall,) : SizedBox.shrink()
           ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 152,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              border: Border.all(
                color: Colors.black
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: widget.icon,
              ),
            
          ),
        ),
      ],
    );
  }
}