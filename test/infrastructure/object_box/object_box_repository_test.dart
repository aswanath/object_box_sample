import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';

import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';
import 'package:object_box_example/objectbox.g.dart';

void main() {
  late ObjectBoxRepository objectBoxRepository;
  late Store store;
  late Person person;
  final String path = '${Directory.current.path}/test/object_box';

  setUp(
    () async {
      store = await openStore(directory: path);
      objectBoxRepository = ObjectBoxRepository(boxStore: store);
      person = Person(place: "Palakkad", name: "Aswanath");
    },
  );

  tearDown(
    () async{
      store.box<Person>().removeAll();
      store.close();
      await Directory(path).delete(recursive: true);
    },
  );

  group(
    "CRUD operations in object box",
    () {
      test(
        "Get all person object list in first place it should be empty",
        () {
          final list = objectBoxRepository.getAllPersons();
          expect(list.length, 0);
        },
      );

      test(
        "Add one person detail",
        () {
          var createId = objectBoxRepository.createPerson(person);
          expect(createId, 1);
          final list = objectBoxRepository.getAllPersons();
          expect(list.length, 1);
          expect(list[0].name, "Aswanath");
          expect(list[0].place, "Palakkad");
        },
      );

      test(
        "get single person detail",
        () {
          int id = objectBoxRepository.createPerson(person);
          Person addedPerson = objectBoxRepository.getSinglePerson(id)!;
          expect(addedPerson.name, addedPerson.name);
          expect(addedPerson.place, addedPerson.place);
        },
      );

      test(
        "Update person detail",
        () {
          int id = objectBoxRepository.createPerson(person);
          Person addedPerson = objectBoxRepository.getSinglePerson(id)!;
          addedPerson.name = "Appu";
          int newId = objectBoxRepository.editPerson(addedPerson);
          expect(newId, id);
          final editPerson = objectBoxRepository.getSinglePerson(newId);
          expect(editPerson!.name, "Appu");
          expect(editPerson.place, "Palakkad");
        },
      );

      test(
        "delete person details",
        () {
          int id = objectBoxRepository.createPerson(person);
          final list = objectBoxRepository.getAllPersons();
          expect(list.length, 1);
          objectBoxRepository.deletePerson(id);
          final newList = objectBoxRepository.getAllPersons();
          expect(newList.length, 0);
        },
      );
    },
  );
}
