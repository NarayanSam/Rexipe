import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");
//
//req.query({
//  limit": "18",
//	"start": "0",
//	"tag": "list.recipe.popular"
//});
//
//req.headers({
//	"X-RapidAPI-Key": "cf02079bb5mshf9f140cc507e1abp1b3f37jsn404feb9b3d40",
//	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
//	"useQueryString": true
//});

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "cf02079bb5mshf9f140cc507e1abp1b3f37jsn404feb9b3d40",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
