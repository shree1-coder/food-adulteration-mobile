import '../../models/food_sample.dart';

class FoodCatalog {
  FoodCatalog._();

  static const List<FoodSample> samples = [
    FoodSample(
      id: 'milk',
      name: 'Milk',
      category: 'Dairy',
    ),
    FoodSample(
      id: 'honey',
      name: 'Honey',
      category: 'Sweetener',
    ),
    FoodSample(
      id: 'turmeric',
      name: 'Turmeric',
      category: 'Spice',
    ),
  ];
}