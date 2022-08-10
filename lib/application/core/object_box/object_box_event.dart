part of 'object_box_bloc.dart';

@immutable
abstract class ObjectBoxEvent {}

class AddPersonEvent extends ObjectBoxEvent {
  final String name;
  final String place;

  AddPersonEvent({
    required this.name,
    required this.place,
  });
}

class EditPersonEvent extends ObjectBoxEvent {
  final Person person;
  EditPersonEvent({required this.person});
}

class DeletePersonEvent extends ObjectBoxEvent {
  final int id;

  DeletePersonEvent({
    required this.id,
  });
}

class GetAllPersonsEvent extends ObjectBoxEvent {}
