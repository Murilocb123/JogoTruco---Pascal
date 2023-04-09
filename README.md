# JogoTruco_Pascal
Jogo de truco desenvolvido na materia de estrutura de dados




# Documentação das funcões - Jogo de truco
## Valores:
```pascal

{Valor do nipe       = 4 - paus 3 - copas 2 - espadas 1 - moles}
{Poder por num carta = [10] - 3, [9] - 2, [8] - 1, [7] - 12 [6] - 11 [5] - 10 [4] - 7, [3] - 6, [2] - 5, [1] - 4 | esse valor vezes 4}

```

## listagem de units referente ao baralho:
```bash
     ∟ baralho.pas
     ∟ carta.pas 
     ∟ lista_carta.pas
     ∟ pilha_carta.pas
``` 
### lista_carta.pas:
```pascal
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

### pilha_carta.pas
```pascal
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

### carta.pas

```pascal
  // Procedure usada para definir o poder da carta, caso o tipo for 'c' aumenta o poder da carta em + 40
  function carta_define_poder(pod, num, nipe:integer; tipo:char):integer; 
  //Cria as cartas com base no numero e no nipe, poder é definido com base em seu numero
  function carta_criar(num, nipe:integer):Tcarta;
  // Escreve a carta passada por parametro
  procedure carta_escrever(carta: tCarta);
```