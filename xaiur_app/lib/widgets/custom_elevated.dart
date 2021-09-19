import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Size? size;
  final String? text;
  final Color? color;

  CustomElevatedButton({
    this.text,
    this.color,
    this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Container(
          width: size!.width,
          height: size!.height,
          alignment: Alignment.center,
          child: Text(
            text!,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(fontSize: 18.0, color: Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: color ?? Colors.black,
          shadowColor: Colors.black45,
          onSurface: Theme.of(context).accentColor,
        ));
  }
}
