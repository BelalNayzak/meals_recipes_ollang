import 'package:flutter/foundation.dart';

class MealModel with ChangeNotifier {
  String? id;
  String? title;
  String? img;
  String? cat;
  String? cookTime;
  bool isFav;
  List? ingredients;
  String? shareLink;

  MealModel({
    this.id,
    this.title,
    this.img,
    this.cat,
    this.cookTime,
    this.isFav = false,
    this.ingredients,
    this.shareLink,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      title: json['label'],
      img: json['image'],
      cat: json['dishType']?[0],
      cookTime: json['totalTime'].toStringAsFixed(0),
      ingredients: json['ingredientLines'],
      shareLink: json['shareAs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': title,
      'image': img,
      'dishType': cat,
      'totalTime': cookTime,
      'isFav': isFav,
      'ingredientLines': ingredients,
      'shareAs': shareLink,
    };
  }

  toggleMealFavStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
