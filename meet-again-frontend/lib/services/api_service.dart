import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meet_again_frontend/models/webtoon_episode_model.dart';
import 'package:meet_again_frontend/models/webtoon_model.dart';

import '../models/detail_webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebToonModel>> getTodaysToons() async {
    List<WebToonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        final toon = WebToonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<DetailWebToonModel> getDetailToonById(String id) async {

    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {

      final webtoon = jsonDecode(response.body);

      return DetailWebToonModel.fromJson(webtoon);
    }

    throw Error();
  }

  static Future<List<WebToonEpisodeModel>> getLatestEpisodeById(String id) async {

    List<WebToonEpisodeModel> episodesInstances = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {

      final episodes = jsonDecode(response.body);
      for(var episode in episodes){
        episodesInstances.add(WebToonEpisodeModel.fromJson(episode));
      }

      return episodesInstances;
    }
    throw Error();
  }
}
