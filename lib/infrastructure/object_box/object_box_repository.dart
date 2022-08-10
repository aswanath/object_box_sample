import 'package:object_box_example/domain/object_box/objectbox.g.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/main.dart';

class ObjectBoxRepository {
   Box<Person> box = store.box<Person>();


  void createPerson(Person person) {
     box.put(person);
  }

  List<Person> getAllPersons() {
    final list = box.getAll();
    return list;
  }

  void editPerson(Person person) {
    box.put(person,mode: PutMode.update);
  }

  void deletePerson(int id) {
    box.remove(id);
  }
}
