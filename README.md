# JogoTruco_Pascal
Jogo de truco desenvolvido na materia de estrutura de dados


- listagem de units referente ao baralho:
```bash
     ∟ baralho.pas
     ∟ carta.pas 
     ∟ lista_carta.pas
     ∟ pilha_carta.pas
``` 

# Documentação das funcões - Jogo de truco



## Lista de Carta:
``` pascal
  type
    tListaCarta = record
      arr: array[1..listaMaxSize] of tCarta;
      qtd: integer;
      max: integer;
    end;

  procedure escreverListaCarta(lista: tListaCarta);
  function removerValorDaListaCarta(valor: tCarta; var lista: tListaCarta): integer;
  function removerDaListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;
  procedure inserirNaListaCarta(valor: tCarta;var lista: tListaCarta);
  procedure inicializarListaCarta(var lista: tListaCarta; tamanho: integer);
  function recuperarValorListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;

```

## Pilha de Carta:
``` pascal
  type
    tPilhaCarta = record
      arr: array[1..pilhaMaxSize] of tCarta;
      qtd: integer;
      max: integer;
    end;

  procedure escreverPilhaCarta(pilha: tPilhaCarta);
  function removerDaPilhaCarta(var pilha: tPilhaCarta): tCarta;
  function recuperarValorPilhaCarta(var pilha: tPilhaCarta): tCarta;
  function recuperarValorPilhaCartaPorPosicao(posicao: integer; var pilha: tPilhaCarta): tCarta;
  function inserirNaPilhaCarta(valor: tCarta;var pilha: tPilhaCarta):integer;
  procedure inicializarPilhaCarta(var pilha: tPilhaCarta; tamanho: integer);


```