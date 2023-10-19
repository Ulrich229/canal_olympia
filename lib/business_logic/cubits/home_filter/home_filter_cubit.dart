import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_filter_state.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit()
      : super(
          const HomeFilterState(selectedFilterIndex: 0, filters: [
            "Les nouveautés",
            "Vos préférences",
            "Catégories",
          ]),
        );
  void changeFilter(int index) {
    if (index != state.selectedFilterIndex) {
      emit(
        HomeFilterState(
          selectedFilterIndex: index,
          filters: state.filters,
        ),
      );
    }
  }
}
