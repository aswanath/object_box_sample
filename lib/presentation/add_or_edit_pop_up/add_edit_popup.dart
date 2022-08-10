import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:object_box_example/application/core/object_box/object_box_bloc.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/presentation/add_or_edit_pop_up/widgets/custom_form_field.dart';

class CustomPopup extends StatefulWidget {
  final bool isEdit;
  final Person? person;

  const CustomPopup({
    Key? key,
    this.isEdit = false,
    this.person,
  }) : super(key: key);

  @override
  State<CustomPopup> createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.person != null) {
      _nameController.text = widget.person!.name;
      _placeController.text = widget.person!.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ObjectBoxBloc, ObjectBoxState>(
      listener: (context, state) {
        if (state is PersonPutSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  controller: _nameController,
                  labelText: 'Name',
                  validator: stringValidation,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  controller: _placeController,
                  labelText: 'Place',
                  validator: stringValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      if (widget.isEdit) {
                        Person person = widget.person!;
                        person.name = _nameController.text;
                        person.place = _placeController.text;
                        context.read<ObjectBoxBloc>().add(
                              EditPersonEvent(person: person),
                            );
                      } else {
                        context.read<ObjectBoxBloc>().add(
                              AddPersonEvent(
                                name: _nameController.text,
                                place: _placeController.text,
                              ),
                            );
                      }
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("SAVE"),
                ),
              ],
            ),
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
