import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:object_box_example/application/core/theme/theme_bloc.dart';
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
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const _ChildList();
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
  const _ChildList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
          ),
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (context) => CustomPopup(),
              );
            },
            icon: Icons.edit,
            label: 'Edit',
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
      child: const ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text("Aswanath"),
        subtitle: Text("Kerala"),
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
