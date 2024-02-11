class Palavra {
  // Coloca a Primeira letra da palavra em Maiusculo
  static String captalizarPalavra(String palavraNormal) {
    String palavraCaptalizada = '';

    for (int i = 0; i < palavraNormal.length; i++) {
      if (i == 0) {
        palavraCaptalizada = palavraNormal[0].toUpperCase();
      } else {
        palavraCaptalizada += palavraNormal[i];
      }
    }

    return palavraCaptalizada;
  }
}
