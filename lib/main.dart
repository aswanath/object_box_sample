import 'package:flutter/material.dart';
import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';
import 'package:object_box_example/presentation/app.dart';

import 'domain/object_box/objectbox.g.dart';

late Store store;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  store = await openStore();
  runApp(const MyApp());
}



