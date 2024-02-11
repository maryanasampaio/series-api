import 'package:shelf/shelf_io.dart' as shelf_io;

import 'rotas.dart';

void main() {
  Rotas rotas = Rotas();

  shelf_io.serve(rotas.handler, 'localhost', 8080);
  print('iniciando... http://localhost:8080');
}
