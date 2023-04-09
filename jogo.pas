program truco;
uses crt,
     views,
     baralho,
     carta,
     pilha_carta,
     lista_carta;
var op_main_menu:integer;
    baralho_lista: tListaCarta;
    baralho_pilha: tPilhaCarta;

procedure init(var op_main_menu:integer);
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
    baralho_lista := baralho_init();
    escreverListaCarta(baralho_lista);
    writeln('------------------------------');
    baralho_pilha := baralho_embaralha(baralho_lista);
    escreverPilhaCarta(baralho_pilha);
end;

procedure inicio_partida();
begin
    writeln('partida');
end;

{Programa principal}
Begin
    init(op_main_menu);
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