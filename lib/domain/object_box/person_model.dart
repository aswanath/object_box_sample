import 'package:objectbox/internal.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 01)
class Person {
  int id = 0;
  String name;
  String place;


  Person({
    required this.place,
    required this.name,
  });

  @override
  String toString() => 'Person{name: $name, place: $place}';
}
