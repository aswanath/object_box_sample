import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/objectbox.g.dart';

class ObjectBoxRepository {
  final Store boxStore;
  late Box<Person> box;

  ObjectBoxRepository({required this.boxStore}) {
    box = boxStore.box<Person>();
  }

  int createPerson(Person person) {
    final id = box.put(person);
    return id;
  }

  List<Person> getAllPersons() {
    final list = box.getAll();
    return list;
  }

  int editPerson(Person person) {
    final id = box.put(person, mode: PutMode.update);
    return id;
  }

  bool deletePerson(int id) {
    final isDeleted = box.remove(id);
    return isDeleted;
  }

  void deleteAll() {
    box.removeAll();
  }

  Person? getSinglePerson(int id) {
    final person = box.get(id);
    return person;
  }
}
