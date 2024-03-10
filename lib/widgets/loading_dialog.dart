import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget
{
  String messageText;

  LoadingDialog(
  {
    super.key, required this.messageText,
}
      )
};

@override
Widget build(BuildContext context)
{
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor: Colors.black87,
    child: Container(
      margin: ,
    ),
  );
}