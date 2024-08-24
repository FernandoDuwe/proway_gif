import 'package:http/http.dart' as http;
import 'package:proway_gif/models/giphy_model.dart';
import 'dart:convert';

import 'package:proway_gif/repositories/config_repository.dart';

class GiphyRepository {
  static Future<List<GiphyModel>> getTrends(
      {int limit = 25, int offset = 0}) async {
    String apiKey = await ConfigRepository.getAPIKey();

    // Montando a URI
    Uri uri = Uri.https('api.giphy.com', 'v1/gifs/trending', {
      "api_key": apiKey,
      "limit": limit.toString(),
      "offset": offset.toString(),
      "rating": "g",
      "bundle": "messaging_non_clips"
    });

    // Efetuando a requisição
    http.Response response = await http.get(uri);

    // Convertendo a resposta em Json para Lista
    var list = jsonDecode(response.body);

    List<GiphyModel> gifs = [];

    // Iterando os itens da resposta e desserealizando o conteúdo da requisição em objetos
    (list["data"] as List<dynamic>).forEach((element) {
      gifs.add(GiphyModel.fromJSON(element as Map<String, dynamic>));
    });

    return gifs;
  }

  static Future<List<GiphyModel>> search(String search,
      {int limit = 25, int offset = 0}) async {
    String apiKey = await ConfigRepository.getAPIKey();

    // Montando a requisição de pesquisa
    Uri uri = Uri.https("api.giphy.com", "v1/gifs/search", {
      "api_key": apiKey,
      "q": search,
      "limit": limit.toString(),
      "offset": offset.toString(),
      "rating": "g",
      "lang": "pt",
      "bundle": "messaging_non_clips"
    });

    // Efetuando a requisição
    http.Response response = await http.get(uri);

    //Convertendo o conteúdo da resposta de String para obj
    var responseObj = jsonDecode(response.body);

    List<GiphyModel> gifs = [];

    // Desserealizando e populando a lista de objetos
    (responseObj["data"] as List<dynamic>).forEach((element) =>
        gifs.add(GiphyModel.fromJSON(element as Map<String, dynamic>)));

    return gifs;
  }
}
