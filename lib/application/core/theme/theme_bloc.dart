
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:object_box_example/domain/core/theme/theme_util.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: CustomTheme.lightTheme,
            iconData: Icons.dark_mode_outlined,
          ),
        ) {
    on<ChangeTheme>((event, emit) {
      final ThemeData themeData = state.themeData == CustomTheme.darkTheme ? CustomTheme.lightTheme : CustomTheme.darkTheme;
      final IconData iconData = state.iconData == Icons.dark_mode_outlined ? Icons.light_mode_outlined : Icons.dark_mode_outlined;
      emit(
        ThemeState(themeData: themeData, iconData: iconData),
      );
    });
  }
}
