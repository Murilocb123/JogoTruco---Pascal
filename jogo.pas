program truco;
uses crt,
     views,
     baralho,
     carta,
     pilha_carta,
     lista_carta;
var op_main_menu, coringa:integer;
    baralho_lista, mao_jogador1,  mao_jogador2: tListaCarta;
    baralho_pilha: tPilhaCarta;

procedure init();
begin
    op_main_menu:= 0;
    inicializarListaCarta(mao_jogador1, 3);
    inicializarListaCarta(mao_jogador2, 3);
end;

{Ler opcoes dos menus em geral}
procedure ler_opcao_menu(var op:integer);
begin
    read(op);
end;

procedure teste();
begin
    //insira o codigo de teste
    baralho_lista := baralho_init();
    escreverListaCarta(baralho_lista);
    writeln('------------------------------');
    baralho_pilha := baralho_embaralha(baralho_lista);
    escreverPilhaCarta(baralho_pilha);
    baralho_realiza_corte(20, baralho_pilha);
    escreverPilhaCarta(baralho_pilha);
    inicializarListaCarta(mao_jogador1, 3);
    inicializarListaCarta(mao_jogador2, 3);
    baralho_distrubui_cartas(mao_jogador1,  mao_jogador2, baralho_pilha, coringa);
    escreverListaCarta(mao_jogador1);
    escreverListaCarta(mao_jogador2);
end;

procedure inicio_partida();
begin
    writeln('partida');
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