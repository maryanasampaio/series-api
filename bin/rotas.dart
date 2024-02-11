import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'series_class.dart';
import 'usuario_class.dart';

class Rotas {
  Handler get handler {
    Router router = Router();

    router.get('/serie/<id>', (Request req, String id) async {
      try {
        var serieEspecifica = await Series.serieEspecifica(id);

        return Response.ok(serieEspecifica);
      } catch (Exception) {
        return Response.badRequest(body: 'Irmão, vc tá mt doido das ideia');
      }
    });

    router.get('/most-viewed', (Request req) async {
      var serieMaisAssistida = await Series.serieMaisAssistida();
      return Response.ok(serieMaisAssistida);
    });

    router.get('/series', (Request req) async {
      var todasAsSeries = await Series.series();
      todasAsSeries = jsonEncode(todasAsSeries);
      return Response.ok(todasAsSeries);
    });

    router.get('/usuario/<id>', (Request req, String id) async {
      try {
        var usuario = await Usuario.getUsuario(id);
        usuario = jsonEncode(usuario);
        return Response.ok(usuario);
      } catch (Exception) {
        return Response.badRequest(body: 'Irmão, vc tá mt doido das ideia');
      }
    });

    router.get('/usuarios', (Request req) async {
      var usuarios = await Usuario.getUsuarios();
      usuarios = jsonEncode(usuarios);
      return Response.ok(usuarios);
    });

    return router;
  }
}
