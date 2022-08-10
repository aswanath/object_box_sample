part of 'object_box_bloc.dart';

@immutable
abstract class ObjectBoxState {}

class ObjectBoxInitial extends ObjectBoxState {}

class AllPersonsState extends ObjectBoxState{
  final List<Person> list;
  AllPersonsState({required this.list});
}

class PersonPutSuccessState extends ObjectBoxState{}
