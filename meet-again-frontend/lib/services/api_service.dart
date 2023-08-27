import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meet_again_frontend/models/webtoon_model.dart';

class ApiService{
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebToonModel>> getTodaysToons() async {

    List<WebToonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if(response.statusCode == 200){
      final List<dynamic> webtoons = jsonDecode(response.body);

      for(var webtoon in webtoons){
        final toon = WebToonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

}