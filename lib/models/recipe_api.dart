import 'dart:convert';
import './recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
// var axios = require("axios").default;

// var options = {
//   method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {limit: '18', start: '0', tag: 'list.recipe.popular'},
//   headers: {
  //   'x-rapidapi-host': 'yummly2.p.rapidapi.com',
  //   'x-rapidapi-key': '378af7b626msh9902347b0c6b423p160955jsna54035668ba5'
//   }
// };

// axios.request(options).then(function (response) {
// 	console.log(response.data);
// }).catch(function (error) {
// 	console.error(error);
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.http('https://yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '18', "start": '0', "tag": 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '378af7b626msh9902347b0c6b423p160955jsna54035668ba5',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipeFromSnapshot(_temp);
  }
}
