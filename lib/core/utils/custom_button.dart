import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onPressed, this.child});
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: child ?? Text(text!, style: const TextStyle(color: Colors.white)),
    );
  }
}
