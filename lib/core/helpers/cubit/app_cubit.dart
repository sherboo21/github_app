import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
      searchSelected: false
        ));

  void changeSelectedSearch() =>
      emit(state.copyWith(searchSelected: !state.searchSelected));

}
