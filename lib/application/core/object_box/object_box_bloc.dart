
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';

part 'object_box_event.dart';

part 'object_box_state.dart';

class ObjectBoxBloc extends Bloc<ObjectBoxEvent, ObjectBoxState> {
  final ObjectBoxRepository objectBoxRepository;

  ObjectBoxBloc({required this.objectBoxRepository}) : super(ObjectBoxInitial()) {
    on<AddDetailsEvent>(
      (event, emit) {

      },
    );
  }
}
