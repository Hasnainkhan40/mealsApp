import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, this.istitle, required this.meal});
  final String? istitle;
  final List<Meal> meal;
  @override
  Widget build(BuildContext context) {
    Widget containt = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh...nothig here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
    if (meal.isNotEmpty) {
      containt = ListView.builder(
        itemCount: meal.length,
        itemBuilder:
            (ctx, index) => MealItem(
              meal: meal[index],
              onSelectMea: (meal) {
                selectMeal(context, meal);
              },
            ),
      );
    }

    return Scaffold(body: containt);
  }
}
