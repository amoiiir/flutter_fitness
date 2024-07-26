import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  //list of model
  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Cakes',
      iconPath: 'assets/icons/blueberry-pancake.svg',
      boxColor: Colors.green,
    ));

    categories.add(
      CategoryModel(
        name: "Canai Bread",
        iconPath: "assets/icons/canai-bread.svg",
        boxColor: Colors.red,
    ));

    categories.add(
      CategoryModel(
        name: "Salad",
      iconPath: "assets/icons/honey-pancakes.svg",
      boxColor: Colors.blue,
    ));

    categories.add(
      CategoryModel(
        name: "Smoothie",
        iconPath: "assets/icons/orange-snacks.svg",
        boxColor: Colors.yellow,
    ));

    return categories;
  }
}