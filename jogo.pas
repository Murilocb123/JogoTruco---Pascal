program truco;
uses crt,
     views,
     baralho,
     carta,
     pilha_carta,
     lista_carta,
     rodada,
     pontuacao,
     util,
     bot,
     jogada;
var op_main_menu: integer;
    pontuacao_anterior: tPontuacao;

procedure init();
begin
    op_main_menu:= 0;
end;

{Ler opcoes dos menus em geral}
procedure ler_opcao_menu(var op:integer);
begin
    read(op);
end;

procedure teste();
var baralho_pilha:tPilhaCarta;
    ultimaCarta:tCarta;
    rodada: tRodada;
    mao_usuario,baralho_lista, mao_maquina:tListaCarta;
    pontuacao: tPontuacao;
    coringa, op:integer;
    value:string;
begin
    //insira o codigo de teste
    // baralho_lista := baralho_init();
    // escreverListaCarta(baralho_lista);
    // // escreverListaCarta(baralho_lista);
    // // writeln('------------------------------');
    //  baralho_pilha := baralho_embaralha(baralho_lista);
    // // escreverPilhaCarta(baralho_pilha);
    //  baralho_realiza_corte(20, baralho_pilha);
    // // escreverPilhaCarta(baralho_pilha);
    //  inicializarListaCarta(mao_usuario, 3);
    //  inicializarListaCarta(mao_maquina, 3);
    //  baralho_distrubui_cartas(mao_usuario,  mao_maquina, baralho_pilha, coringa);
    //  writeln(coringa);
    //  escreverListaCarta(mao_usuario);
    //  writeln('bot:');
    //  escreverListaCarta(mao_maquina);
    //  pontuacao_inicializar(pontuacao);
    //  op:=bot_escolhe_acao(mao_usuario.arr[1], pontuacao, mao_maquina, 0);

    //  writeln('bot escolheu:', op);
    //  rodada_inicializar(rodada, pontuacao);
    //  value := rodada_quem_comeca(rodada);
    //  writeln(value);
end;

procedure inicio_partida();
var manilha:integer;
    baralho_lista, mao_usuario,  mao_maquina: tListaCarta;
    baralho_pilha: tPilhaCarta;
    pontuacao: tPontuacao;
    rodada: tRodada;
    rodada_ganhador, jogada_ganhador: string;
    i, j:integer;
begin
    writeln('Inicio da partida.');

    baralho_lista := baralho_init();
    pontuacao_inicializar(pontuacao);

    // Laço de repetição principal, cada iteração é uma rodada, até alguem vencer o jogo.
    while (not(pontuacao_tem_vencedor(pontuacao))) do begin
      // Limpa a tela e motra a pontuacao atual
      clrscr();

      views_inicio_rodada();

      // Inicializa o baralho e as mãos dos jogadores
      rodada_inicializar(rodada, pontuacao);
      baralho_pilha := baralho_embaralha(baralho_lista);
      baralho_realiza_corte(20, baralho_pilha);
      inicializarListaCarta(mao_usuario, 3);
      inicializarListaCarta(mao_maquina, 3);
      baralho_distrubui_cartas(mao_usuario,  mao_maquina, baralho_pilha, manilha);
      rodada_adicionar_manilha(rodada, manilha);

      // Laço de repetição da rodada (melhor de 3);
      while not (rodada_finalizada(rodada)) do begin
        jogada_ganhador:= jogada_iniciar_jogada(rodada, mao_usuario, mao_maquina,pontuacao);
        if not(jogada_ganhador = 'ARREGAO') then
            rodada_adicionar_resultado(rodada, jogada_ganhador)
        else
            rodada_adicionar_resultado_final(rodada);
        clrscr();
        views_mostra_ganhador_jogada(jogada_ganhador);
        delay(1500);
        clrscr();
      end;

      // Rodada finalizada, mostra os resultados e marca na pontuacao global.
      writeln('Rodada finalizada, resultado: ');
      rodada_mostrar_resultado(rodada);
      rodada_ganhador:= rodada_jogador_ganhador(rodada);
      writeln('Vencedor: ', rodada_ganhador);

      if (rodada_ganhador <> 'NINGUEM') then
        pontuacao_marcar_pontos(pontuacao, rodada_ganhador, rodada_pegar_peso_truco(rodada));
      delay(2000);
    end;
    clrscr();
    writeln('JOGO FINALIZADO!');
    writeln('Ganhador: ', pontuacao_vencedor(pontuacao));
    pontuacao_mostrar_pontos(pontuacao);
    pontuacao_anterior:= pontuacao;

end;

{Programa principal}
Begin
    init();
    while not(op_main_menu = 4) do
    begin
        clrscr();
        views_menu_main();
        ler_opcao_menu(op_main_menu);
        if(op_main_menu = 1) then
            inicio_partida()
        else if(op_main_menu = 2) then
            views_authors()
        else if(op_main_menu = 3) then
            pontuacao_mostrar_pontos(pontuacao_anterior)
        else if(op_main_menu = 4) then
            Writeln('Adeus Jogador')
        else if(op_main_menu = 5) then
            teste();
        readkey();
    end;

End.