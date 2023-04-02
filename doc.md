# Documentação das funcões - Jogo de truco

## Lista:
``` pascal
  procedure escreverLista(lista: tLista);
  function removerValorDaLista(valor: string; var lista: tLista): integer;
  function removerDaListaPorPosicao(posicao: integer; var lista: tLista): string;
  procedure inserirNaLista(valor: string;var lista: tLista);
  procedure inicializarLista(var lista: tLista; tamanho: integer);
  function recuperarValorListaPorPosicao(posicao: integer; var lista: tLista): string;
```

## Pilha:
``` pascal
  procedure escreverPilha(pilha: tPilha);
  function removerDaPilha(var pilha: tPilha): string;
  function recuperarValorPilha(var pilha: tPilha): string;
  function recuperarValorPilhaPorPosicao(posicao: integer; var pilha: tPilha): string;
  function inserirNaPilha(valor: string;var pilha: tPilha):integer;
  procedure inicializarPilha(var pilha: tPilha; tamanho: integer);

```