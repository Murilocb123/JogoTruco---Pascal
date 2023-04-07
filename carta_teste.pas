Program carta_teste;
uses carta, pilha_carta, lista_carta;

var carta, carta_removida: tCarta;
    pilha_carta: tPilhaCarta;
    lista_carta: tListaCarta;
begin

carta:= carta_criar(1, 1);
carta_escrever(carta);

writeln('--------------------- PILHA ---------------------');

  inicializarPilhaCarta(pilha_carta, 40);
  inserirNaPilhaCarta(carta, pilha_carta);

  inserirNaPilhaCarta(carta_criar(2, 4), pilha_carta);
  inserirNaPilhaCarta(carta_criar(12, 4), pilha_carta);
  inserirNaPilhaCarta(carta_criar(6, 3), pilha_carta);
  inserirNaPilhaCarta(carta_criar(4, 3), pilha_carta);
  inserirNaPilhaCarta(carta_criar(3, 4), pilha_carta);

  carta_removida:= removerDaPilhaCarta(pilha_carta);
  carta_escrever(carta_removida);


  escreverPilhaCarta(pilha_carta);

writeln('--------------------- LISTA ---------------------');

  inicializarListaCarta(lista_carta, 40);
  inserirNaListaCarta(carta, lista_carta);

  inserirNaListaCarta(carta_criar(2, 4), lista_carta);
  inserirNaListaCarta(carta_criar(12, 4), lista_carta);
  inserirNaListaCarta(carta_criar(6, 3), lista_carta);
  inserirNaListaCarta(carta_criar(4, 3), lista_carta);
  inserirNaListaCarta(carta_criar(3, 4), lista_carta);

  carta_removida:= removerDaListaCartaPorPosicao(2, lista_carta);
  carta_escrever(carta_removida);
  escreverListaCarta(lista_carta);
end.