import 'dart:convert';
import 'dart:io';

import 'palavras_class.dart';
import 'series_class.dart';

class Usuario {
  // Retorna um Usuário em Específico
  static Future getUsuario(idUserString) async {
    // Transforma uma id de Usuário que recebemos como String em inteiro
    int idUser = int.parse(idUserString);

    if (idUser == 0) {
      return Exception('escolha uma posição da lista entre 1 e 50!');
    } else if (idUser > 50) {
      return Exception('a lista contém apenas 50 séries!');
    }
    // Pega todos os usuários do Sistema
    List<String> todosUsuarios = await listaDeUsuarios();

    // Isola apenas o usuário que queremos
    String usuario = todosUsuarios[idUser - 1];

    // Mapeia os dados do Usuário
    List<String> usuarioSplitado = usuario.split(';');
    var usuarioMapeado = mapeiaUsuario(usuarioSplitado);

    return usuarioMapeado;
  }

  static int idade(String dataDeNascimento) {
    List<String> dadosDaData = dataDeNascimento.split('-');
    int anoDoNascimento = int.parse(dadosDaData[0]);

    var anoAtual = DateTime.now().year;

    var idade = anoAtual - anoDoNascimento;

    return idade;
  }

  // Retorna um Map com os Dados do Usuário
  static Future<Map<String, dynamic>> mapeiaUsuario(
      listaDeDadosDoUsuario) async {
    // Transforma os Gêneros em uma Lista
    List<String> genres = listaDeDadosDoUsuario[2].toString().split(',');

    // Transforma a primeira letra de Cada Gênero Em Maiusculo
    for (int i = 0; i < genres.length; i++) {
      genres[i] = Palavra.captalizarPalavra(genres[i]);
    }

    // Mapeia os Dados Do Usuário
    Map<String, dynamic> map = {
      'name': listaDeDadosDoUsuario[0],
      'age': idade(listaDeDadosDoUsuario[1]),
      'genres': genres,
      'series': await seriesFavoritas(listaDeDadosDoUsuario[3]),
    };

    return map;
  }

  // Retorna uma lista com as séries favoritas do usuário
  static Future seriesFavoritas(String ids) async {
    List<String> listaDeIds = ids.split(',');
    List series = [];

    for (int i = 0; i < listaDeIds.length; i++) {
      series.add(jsonDecode(await Series.serieEspecifica(listaDeIds[i])));
    }
    return series;
  }

  // Lê um arquivo com os usuários
  static Future<String> readUsuarios() async {
    return await File('utils/lista_de_usuarios.txt').readAsString();
  }

  // Retorna uma List com todos os usuários
  static Future<List<String>> listaDeUsuarios() async {
    List<String> listaDeUsuarios = (await readUsuarios()).split('\n');
    return listaDeUsuarios;
  }

  static Future getUsuarios() async {
    List<String> usuarios = await listaDeUsuarios();

    List usuariosMapeados = [];

    for (int i = 0; i < usuarios.length; i++) {
      usuariosMapeados.add(await mapeiaUsuario(usuarios[i].split(';')));
    }
    return usuariosMapeados;
  }
}
