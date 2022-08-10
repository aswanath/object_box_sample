import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:object_box_example/application/core/object_box/object_box_bloc.dart';
import 'package:object_box_example/application/core/theme/theme_bloc.dart';
import 'package:object_box_example/infrastructure/object_box/object_box_repository.dart';
import 'package:object_box_example/main.dart';
import 'package:object_box_example/presentation/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => ObjectBoxBloc(
            objectBoxRepository: ObjectBoxRepository(boxStore: store),
          )..add(GetAllPersonsEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Object Box Example',
            theme: state.themeData,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
