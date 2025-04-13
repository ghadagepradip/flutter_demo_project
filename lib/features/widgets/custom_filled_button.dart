import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback callBack;
  final bool? isDisabled;
  const CustomFilledButton({super.key, required this.title, required this.callBack, this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),

      ),

      onPressed:callBack,
      child: Text(title),
    );
  }
}
