program truco;
uses crt, 
		 views;
	

var op_main_menu:integer;

procedure init(var op_main_menu:integer);
begin
    op_main_menu:= 0;
end;

{Ler opcoes dos menus em geral}
procedure view_ler_opcao_menu(var op:integer);
begin
    read(op);
end;

procedure teste();
begin
    //insira o codigo de teste
end;

procedure inicio_partida();

begin
    writeln('partida');
    readkey; //manter para que quando acabe a partida so volte para o menu caso o usuario clicar em alguma tecla
end;

{Programa principal}
Begin
    init(op_main_menu);
    while not(op_main_menu = 3) do
    begin
        view_menu_main();
        ler_opcao_menu(op_main_menu);
        if(op_main_menu = 1) then
            inicio_partida()
        else if(op_main_menu = 2) then
            view_authors()
        else if(op_main_menu = 3) then
            Writeln('Adeus Jogador')
        else if(op_main_menu = 4) then
            Writeln('mostra resultado anterior')
        else if(op_main_menu = 5) then
            teste();
    end;

End.