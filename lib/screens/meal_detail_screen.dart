import 'package:flutter/material.dart';
import '../dummyData/dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  static const routeName = '/meal_detail_screen';

  Widget buildTextTitle(BuildContext ctx, String tx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        tx,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildReusableContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTextTitle(context, 'Ingredients'),
            buildReusableContainer(
              ListView.builder(
                itemBuilder: (ctx, indx) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[indx]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTextTitle(context, 'Steps'),
            buildReusableContainer(
              ListView.builder(
                itemBuilder: (ctx, indx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(indx + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[indx]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.redAccent[400],
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
