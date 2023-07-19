import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/provider/filters_provider.dart';
import 'package:meals/models/meal.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filters';

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;
  late bool isVegetarian;

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);

    isGlutenFree = filters.contains(Filter.glutenFree);
    isLactoseFree = filters.contains(Filter.lactoseFree);
    isVegan = filters.contains(Filter.vegan);
    isVegetarian = filters.contains(Filter.vegetarian);

    final titleTextStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).colorScheme.onBackground);
    final subTitleTextStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.65),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (value) {
              setState(() {
                isGlutenFree = value;
              });
              value
                  ? ref
                      .read(filtersProvider.notifier)
                      .addFilter(Filter.glutenFree)
                  : ref
                      .read(filtersProvider.notifier)
                      .removeFilter(Filter.glutenFree);
            },
            title: Text(
              'Gluten-free',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: subTitleTextStyle,
            ),
          ),
          SwitchListTile.adaptive(
            title: Text(
              'Lactose-free',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: subTitleTextStyle,
            ),
            value: isLactoseFree,
            onChanged: (value) {
              setState(() {
                isLactoseFree = value;
              });
              value
                  ? ref
                      .read(filtersProvider.notifier)
                      .addFilter(Filter.lactoseFree)
                  : ref
                      .read(filtersProvider.notifier)
                      .removeFilter(Filter.lactoseFree);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: subTitleTextStyle,
            ),
            value: isVegan,
            onChanged: (value) {
              setState(() {
                isVegan = value;
              });
              value
                  ? ref.read(filtersProvider.notifier).addFilter(Filter.vegan)
                  : ref
                      .read(filtersProvider.notifier)
                      .removeFilter(Filter.vegan);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: subTitleTextStyle,
            ),
            value: isVegetarian,
            onChanged: (value) {
              setState(() {
                isVegetarian = value;
              });
              value
                  ? ref
                      .read(filtersProvider.notifier)
                      .addFilter(Filter.vegetarian)
                  : ref
                      .read(filtersProvider.notifier)
                      .removeFilter(Filter.vegetarian);
            },
          ),
        ],
      ),
    );
  }
}
