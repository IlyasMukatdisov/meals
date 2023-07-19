// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/widgets/favorite_button.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  static const routeName = '/meal-details';

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final Color onBackgroundColor = Theme.of(context).colorScheme.onBackground;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButton: FavoriteButton(
        meal: meal,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    imageUrl: meal.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Text(
                'Ingredients:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              ...meal.ingredients
                  .map(
                    (i) => Text(
                      i,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: onBackgroundColor),
                    ),
                  )
                  .toList(),
              const SizedBox(height: 10),
              Text(
                'Steps:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              for (int i = 0; i < meal.steps.length; i++)
                Text(
                  '${i + 1}. ${meal.steps[i]}',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: onBackgroundColor,
                      ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
