import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';

part 'object_box_event.dart';

part 'object_box_state.dart';

class ObjectBoxBloc extends Bloc<ObjectBoxEvent, ObjectBoxState> {
  final ObjectBoxRepository objectBoxRepository;

  ObjectBoxBloc({required this.objectBoxRepository}) : super(ObjectBoxInitial()) {

    on<AddPersonEvent>(
      (event, emit) {
        final person = Person(place: event.place, name: event.name);
        objectBoxRepository.createPerson(person);
        emit(PersonPutSuccessState());
        add(GetAllPersonsEvent());
      },
    );
    on<DeletePersonEvent>(
      (event, emit) {
        objectBoxRepository.deletePerson(event.id);
        add(GetAllPersonsEvent());
      },
    );
    on<EditPersonEvent>(
      (event, emit)  {
         objectBoxRepository.editPerson(event.person);
         emit(PersonPutSuccessState());
         add(GetAllPersonsEvent());
      },
    );
    on<GetAllPersonsEvent>(
      (event, emit) async {
        final list = objectBoxRepository.getAllPersons();
        emit(
          AllPersonsState(list: list),
        );
      },
    );
  }
}
