import 'package:flutter/material.dart';
import 'package:object_box_example/presentation/add_or_edit_pop_up/widgets/custom_form_field.dart';

class CustomPopup extends StatelessWidget {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  CustomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const TextFieldCustom(
                labelText: 'Name',
                validator: stringValidation,
              ),
              const SizedBox(
                height: 10,
              ),
              const TextFieldCustom(
                labelText: 'Place',
                validator: stringValidation,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  globalKey.currentState!.validate();
                },
                icon: const Icon(Icons.save),
                label: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? stringValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Required";
  } else {
    return null;
  }
}