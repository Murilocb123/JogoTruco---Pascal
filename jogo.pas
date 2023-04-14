program truco;
uses crt,
     views,
     baralho,
     carta,
     pilha_carta,
     lista_carta,
     rodada,
     pontuacao,
     util;
var op_main_menu: integer;

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
begin
    //insira o codigo de teste
    // baralho_lista := baralho_init();
    // escreverListaCarta(baralho_lista);
    // writeln('------------------------------');
    // baralho_pilha := baralho_embaralha(baralho_lista);
    // escreverPilhaCarta(baralho_pilha);
    // baralho_realiza_corte(20, baralho_pilha);
    // escreverPilhaCarta(baralho_pilha);
    // inicializarListaCarta(mao_usuario, 3);
    // inicializarListaCarta(mao_maquina, 3);
    // baralho_distrubui_cartas(mao_usuario,  mao_maquina, baralho_pilha, coringa);
    // escreverListaCarta(mao_usuario);
    // escreverListaCarta(mao_maquina);
end;

procedure inicio_partida();
var coringa:integer;
    baralho_lista, mao_usuario,  mao_maquina: tListaCarta;
    baralho_pilha: tPilhaCarta;
    pontucao: tPontuacao;
begin
    writeln('Inicio da partida.');

    baralho_lista := baralho_init();
    pontuacao_inicializar(pontucao);
    // while not(pontuacao_tem_vencedor(pontuacao)) do begin
      baralho_pilha := baralho_embaralha(baralho_lista);
      baralho_realiza_corte(20, baralho_pilha);
      inicializarListaCarta(mao_usuario, 3);
      inicializarListaCarta(mao_maquina, 3);
      baralho_distrubui_cartas(mao_usuario,  mao_maquina, baralho_pilha, coringa);
      escreverListaCarta(mao_usuario);
      escreverListaCarta(mao_maquina);
      writeln(coringa);
    // end;
















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
            Writeln('mostra resultado anterior')
        else if(op_main_menu = 4) then
            Writeln('Adeus Jogador')
        else if(op_main_menu = 5) then
            teste();
        readkey();
    end;

End.