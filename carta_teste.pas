Program carta_teste;
uses carta, pilha_carta;

var carta: tCarta;
    pilha_carta: tPilhaCarta;
begin

carta:= carta_criar(1, 1);
carta_escrever(carta);

inicializarPilhaCarta(pilha_carta, 40);
inserirNaPilhaCarta(carta, pilha_carta);

inserirNaPilhaCarta(carta_criar(2, 4), pilha_carta);
inserirNaPilhaCarta(carta_criar(12, 4), pilha_carta);
inserirNaPilhaCarta(carta_criar(6, 3), pilha_carta);
inserirNaPilhaCarta(carta_criar(4, 3), pilha_carta);
inserirNaPilhaCarta(carta_criar(3, 4), pilha_carta);

escreverPilhaCarta(pilha_carta);



end.