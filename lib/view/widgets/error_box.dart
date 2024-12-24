import 'package:flutter/material.dart';
import 'package:mytal/util/dimensions.dart';

class ErrorBox extends StatelessWidget {
  final String error;
  const ErrorBox({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Center(
              child: Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          )),
    );
  }
}
