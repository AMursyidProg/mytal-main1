import 'package:flutter/material.dart';
import 'package:mytal/util/dimensions.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.start,
                        minLines: 4,
                        maxLines: null,
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'How can we help?',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("We'll get back to you soon")),
                          );

                          textController.text = '';
                        },
                        child: const Text('Send Message'),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
