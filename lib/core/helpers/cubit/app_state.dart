class AppState {
  final bool searchSelected;

  AppState({
    required this.searchSelected,
  });

  AppState copyWith({
    bool? searchSelected,
  }) {
    return AppState(
      searchSelected: searchSelected ?? this.searchSelected,
        );
  }
}
