import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:object_box_example/application/core/object_box/object_box_bloc.dart';
import 'package:object_box_example/application/core/object_box/object_box_bloc.dart';
import 'package:object_box_example/application/core/theme/theme_bloc.dart';
import 'package:object_box_example/domain/object_box/person_model.dart';
import 'package:object_box_example/presentation/add_or_edit_pop_up/add_edit_popup.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Objecto"),
        centerTitle: true,
        leading: const _ThemeIconButton(),
      ),
      body: BlocBuilder<ObjectBoxBloc, ObjectBoxState>(
        builder: (context, state) {
          if (state is AllPersonsState && state.list.isNotEmpty) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return _ChildList(
                  person: state.list[index],
                );
              },
            );
          } else {
            return const Center(
              child: Text("Person list is empty"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CustomPopup(),
          );
        },
        label: const Icon(Icons.add),
      ),
    );
  }
}

class _ChildList extends StatelessWidget {
  final Person person;

  const _ChildList({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<ObjectBoxBloc>().add(
                    DeletePersonEvent(id: person.id),
                  );
            },
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
          ),
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (context) => CustomPopup(
                  isEdit: true,
                  person: person,
                ),
              );
            },
            icon: Icons.edit,
            label: 'Edit',
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.ac_unit),
        title: Text(person.name),
        subtitle: Text(person.place),
      ),
    );
  }
}

class _ThemeIconButton extends StatelessWidget {
  const _ThemeIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeBloc>().add(
              ChangeTheme(),
            );
      },
      icon: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Icon(state.iconData);
        },
      ),
    );
  }
}
