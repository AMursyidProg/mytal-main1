import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool loading;
  final String text;
  const SaveButton({Key? key, required this.onPressed, this.loading = false, this.text = "Save"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!loading) {
          onPressed();
        }
      },
      child: Stack(
        children: [
          Opacity(
            opacity: loading ? 0 : 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: loading ? Theme.of(context).primaryColor.withOpacity(0.5) : null,
                ),
              ),
            ),
          ),
          if (loading)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
