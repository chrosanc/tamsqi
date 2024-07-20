import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class FormWidget extends StatefulWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final Function()? onTap;


  const FormWidget({ Key? key, this.title, this.hintText, this.controller, this.prefixIcon, this.suffixIcon, this.obscureText = false, this.onTap, this.enabled = true }) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: widget.title == null ? const SizedBox.shrink() : Column(
            children: [
              Text(widget.title!,style: appTheme.textTheme.titleSmall,),
              const SizedBox(height: 8),

            ],
          )),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(8)
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              enabled: widget.enabled,
              style: appTheme.textTheme.bodyMedium,
              
              decoration: InputDecoration(
                
                hintText: widget.hintText,
                hintStyle: appTheme.textTheme.bodySmall,
                prefixIcon: widget.prefixIcon,
                contentPadding: widget.suffixIcon != null ? EdgeInsets.symmetric(horizontal: 16, vertical: 16) : EdgeInsets.symmetric(horizontal: 16),
                suffixIcon: widget.suffixIcon != null
                    ? SizedBox(
                        width: 24.0, // set the desired width
                        height: 24.0, // set the desired height
                        child: widget.suffixIcon,
                      )
                    : null,

                border: InputBorder.none
              ),
            ),
          ),
        )
      ],
    );
  }
}