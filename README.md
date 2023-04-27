# JogoTruco_Pascal
Jogo de truco desenvolvido na materia de estrutura de dados




# Documentação das funcões - Jogo de truco
## Valores:
> O poder das cartas são definidas da seguinte forma: 4 * o poder por numero + nipe, durante a comparação de cartas jogadas é romovido o nipe para considera se empachou, validando assim somente o numero da carta
```pascal

{Valor do nipe       = 4 - paus 3 - copas 2 - espadas 1 - moles}
{Poder por num carta = [10] - 3, [9] - 2, [8] - 1, [7] - 12 [6] - 11 [5] - 10 [4] - 7, [3] - 6, [2] - 5, [1] - 4 | esse valor vezes 4}
```

## listagem de units referente ao baralho:
```bash
     ∟ baralho.pas
     ∟ pilha_carta.pas
     ∟ carta.pas 
     ∟ lista_carta.pas
     ∟ bot.pas
     ∟ jogada.pas
     ∟ jogo.pas
     ∟ pontuacao.pas
     ∟ rodada.pas
     ∟ util.pas
     ∟ views.pas
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
procedure inserirNaPilhaCarta(valor: tCarta;var pilha: tPilhaCarta);
procedure inicializarPilhaCarta(var pilha: tPilhaCarta; tamanho: integer);
```

### carta.pas

```pascal
type
tCarta = record
  poder: integer;
  tipo: char;
  num: integer;
  nipe: integer;
end;

function carta_define_poder(pod, num, nipe:integer; tipo:char):integer;
function carta_criar(num, nipe:integer):Tcarta;
procedure carta_escrever(carta: tCarta);
procedure carta_verifica_manilha(var carta:tCarta; manilha:integer);
procedure carta_redefine_poder_sem_nipe(var carta:tCarta);
function carta_redefine_poder_sem_nipe_integer(var carta:tCarta):integer;
procedure carta_escrever_com_poder(carta: tCarta);

```

### baralho.pas

```pascal
function baralho_init():tListaCarta;
function baralho_embaralha(lista_carta: tListaCarta):tPilhaCarta;
{funcao para realizar o corte usando somente pilhas, pilha_carta_aux1 usada para armazenar o montante cortado e inserir em baixo da pilha}
function baralho_realiza_corte(posi_corte:integer; var baralho_pilha_embaralhado:tPilhaCarta):integer;
procedure baralho_distrubui_cartas( var mao_jogador1, mao_jogador2:tListaCarta; var baralho_pilha_cortado:tPilhaCarta; var manilha:integer);
function baralho_define_manilha(num:integer):integer;

```
### bot.pas

```pascal

{Retorna a opção escolhida}
function bot_escolhe_acao(ultimaCarta:tCarta; pontuacaoPartida:tPontuacao; cartasLista:tListaCarta):integer;
procedure bot_joga_carta(var listaCarta:tListaCarta; cartaPosi:integer; var carta:tCarta);
function getMediaPoderCartas(listaCarta:tListaCarta):integer;
function getCarta(listaCarta:tListaCarta; ultimaCarta:tCarta):integer;
function comparaCartas(listaCarta:tListaCarta; ultimaCarta:tCarta): integer;
function bot_decisao_truco():integer;

```
### jogada.pas

```pascal

function jogada_iniciar_jogada(rodada:tRodada; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao):String;

```
### jogo.pas

```pascal
{programa principal}

```
### pontuacao.pas

```pascal
type
tPontuacao = record
  pontos_usuario: integer;
  pontos_maquina: integer;
  pontos_ultimo_vencedor: string;
end;

procedure pontuacao_inicializar(pontuacao:tPontuacao); // PROCEDIMENTO zera a pontuacao
function pontuacao_tem_vencedor(pontuacao:tPontuacao):boolean; // FUNCAO TEM VENCEDOR true ou false
function pontuacao_vencedor(pontuacao:tPontuacao): string; //FUNCAO VENCEDOR string
procedure pontuacao_mostrar_pontos(pontuacao:tPontuacao); //PROCEDIMENTO MOSTRAR PONTUACAO SALVA NO REGISTRO
procedure pontuacao_marcar_pontos(pontuacao:tPontuacao;pontuador:string;valor:integer); //PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3}
function pontuacao_ultimo_ganhador(pontuacao:tPontuacao):string; //ULTIMO GANHADOR (chamada no marcarPontos)
function pontuacao_escura(pontuacao:tPontuacao):boolean; //COMANDO ESCURA (quando ambos tiverem 11 pontos)
function pontuacao_quanto_falta_pro_perderdor_ganhar(pontuacao: tPontuacao): integer; // Retorna quantos pontos restam pro perdedor ganhar
function pontuacao_esta_mao_onze(pontuacao: tPontuacao; jogador: string): boolean;

```
### rodada.pas

```pascal
type tRodada = record
  jogadas_vencedor: array[1..3] of string; //MAQUINA, USUARIO, EMPACHE
  jogada_atual: integer;
  manilha:integer;
  ultimo_comecou:String;
  peso_truco: integer;
  peso_maximo_truco: integer;
  ultimo_aumentou_truco: String;
  arregao: String;
end;

function rodada_jogador_ganhou(rodada: tRodada; jogador: string): boolean;
function rodada_finalizada(rodada: tRodada): boolean;
function rodada_jogador_ganhador(rodada: tRodada): string;
function rodada_quem_comeca(rodada: tRodada): string;
procedure rodada_inicializar(var rodada: tRodada; pontuacao: tPontuacao);
procedure rodada_adicionar_resultado(rodada: tRodada; resultado: string);
procedure rodada_adicionar_resultado_final(var rodada: tRodada);
procedure rodada_adicionar_arregao(var rodada: tRodada; arre:string);
procedure rodada_mostrar_resultado(rodada: tRodada);
procedure rodada_adicionar_manilha(rodada: tRodada; manilha_valor:integer);
function rodada_pode_aumentar_truco(rodada: tRodada): boolean;
procedure rodada_aumentar_peso_truco(var rodada: tRodada; quem_aumentou: string);
function rodada_pegar_peso_truco(rodada: tRodada): integer;
function rodada_jogador_pode_pedir_truco(rodada: tRodada; jogador: string):boolean;



```
### utils.pas

```pascal
function aleatorioEntre(min, max: integer): integer;
function inverte_jogador(jogador: string):string;
function percentPerOption(porcent:integer):integer;

```
### views.pas

```pascal

procedure views_menu_main();
procedure views_authors();
procedure views_resposta_truco(pode_aumentar: boolean; acao:string);
procedure views_menu_jogada(rodada:tRodada; mao_usuario:tListaCarta; pontuacao: tPontuacao;ultima_carta:tCarta);
procedure views_mostra_ganhador_jogada(nome:string);
procedure views_mostra_carta_jogada(cartaUsuario, cartaMaquina:Tcarta);
procedure views_inicio_rodada();

```

