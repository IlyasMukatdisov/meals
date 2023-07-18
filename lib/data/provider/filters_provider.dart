import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FiltersNotifier extends Notifier<List<Filter>> {
  @override
  List<Filter> build() {
    return [];
  }

  void addFilter(Filter filter) {
    state = [...state, filter];
  }

  void removeFilter(Filter filter) {
    state = state.where((f) => f != filter).toList();
  }
}

final filtersProvider = NotifierProvider<FiltersNotifier, List<Filter>>(
  () {
    return FiltersNotifier();
  },
);
