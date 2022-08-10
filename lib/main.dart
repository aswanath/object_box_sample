import 'dart:io';

import 'package:flutter/material.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';
import 'package:object_box_example/presentation/app.dart';
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';


late Store store;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // getApplicationDocumentsDirectory();
  final directory = await getApplicationDocumentsDirectory();
  // Directory directory = await Directory('dir/subdir').create(recursive: true);
  store = await openStore(directory: directory.path);
  runApp(const MyApp());
}



