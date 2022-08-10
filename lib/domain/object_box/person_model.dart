import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  int id = 0;
  String name;
  String place;

  Person({required this.place, required this.name});

  @override
  String toString() => 'Person{name: $name, place: $place}';
}
