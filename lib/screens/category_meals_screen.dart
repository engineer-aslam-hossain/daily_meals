import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];
    displayedMeals = widget.availableMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, indx) {
            return MealItem(
              id: displayedMeals[indx].id,
              title: displayedMeals[indx].title,
              imageUrl: displayedMeals[indx].imageUrl,
              duration: displayedMeals[indx].duration,
              complexity: displayedMeals[indx].complexity,
              affordability: displayedMeals[indx].affordability,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
