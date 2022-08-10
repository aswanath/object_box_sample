part of 'object_box_bloc.dart';

@immutable
abstract class ObjectBoxEvent {}

class AddDetailsEvent extends ObjectBoxEvent {
  final String name;
  final String place;

  AddDetailsEvent({
    required this.name,
    required this.place,
  });
}
