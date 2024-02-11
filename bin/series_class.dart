import 'dart:convert';
import 'dart:io';

class Series {
  static Map<String, String> caracteristicasDaSerie(param) {
    Map<String, String> map = {
      'nome': param[0],
      'airing': param[1],
      'views': param[2],
      'streaming': param[3],
    };
    return map;
  }

  static Future<String> lerLista() async {
    return await File('utils/lista_de_series.txt').readAsString();
  }

  static Future<List<String>> arrayDeSeries() async {
    List<String> listaDeseries = (await lerLista()).split('\n');
    return listaDeseries;
  }

  static Future serieEspecifica(String indice) async {
    int indiceConvertido = int.parse(indice);

    if (indiceConvertido == 0) {
      return Exception('escolha uma posição da lista entre 1 e 50!');
    } else if (indiceConvertido > 50) {
      return Exception('a lista contém apenas 50 séries!');
    }
    List<String> series = await arrayDeSeries();
    List<String> serie = series[indiceConvertido - 1].split(';');

    return jsonEncode(caracteristicasDaSerie(serie));
  }

  static Future series() async {
    List<String> series = await arrayDeSeries();
    List<Map> todasAsSeries = [];

    for (var serie in series) {
      List<String> dadosSerie = serie.split(';');
      todasAsSeries.add(caracteristicasDaSerie(dadosSerie));
    }

    return todasAsSeries;
  }

  static Future serieMaisAssistida() async {
    String todasAsSeries = await series();

    List json = jsonDecode(todasAsSeries);
    int indiceDoMaisVisto = 0;
    int quantidadeViews = 0;

    for (int i = 0; i < json.length; i++) {
      int viewsDaSerieAtual = int.parse(json[i]['views']);

      if (viewsDaSerieAtual > quantidadeViews) {
        indiceDoMaisVisto = i;
        quantidadeViews = viewsDaSerieAtual;
      }
    }

    return jsonEncode(json[indiceDoMaisVisto]);
  }
}

void main(List<String> args) async {
  print(await Series.arrayDeSeries());
}
