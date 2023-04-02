# Documentação das funcões - Jogo de truco

## Lista:
``` pascal
  procedure mostrarLista(lista: tLista);
  //Mostra a lista na tela com writeln

  function removerDaLista(valor: integer; var lista: tLista): integer;
  //Encontra e remove um valor especifico da lista

  procedure inserirNaLista(valor: integer;var lista: tLista);
  procedure inicializarLista(var lista: tLista; tamanho: integer);
  function removerDaListaPorPosicao(posicao: integer; var lista: tLista): integer;
  function recuperarValorLista(posicao: integer; var lista: tLista): integer;
```