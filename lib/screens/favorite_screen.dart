import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'You have no Favorite meal yet - start doing adding some.',
            style: Theme.of(context).textTheme.headline6.copyWith(),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, indx) {
        return MealItem(
          id: favoriteMeals[indx].id,
          title: favoriteMeals[indx].title,
          imageUrl: favoriteMeals[indx].imageUrl,
          duration: favoriteMeals[indx].duration,
          complexity: favoriteMeals[indx].complexity,
          affordability: favoriteMeals[indx].affordability,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
