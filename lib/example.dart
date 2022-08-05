
import 'package:objectbox/objectbox.dart';

@Entity()
class Person{
  int id = 0;
  final String name;
  final int pin;

  Person({required this.name,required this.pin});

  @override
  String toString() => 'Person{id: $id, name: $name, pin: $pin';
}