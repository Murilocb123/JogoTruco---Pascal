unit views
interface
    procedure views_menu_main();
    procedure views_authors();

implementation
    procedure views_menu_main();
    begin
        Writeln('---------------------------------');
        Writeln('[1] - Start Game'); 
        Writeln('[2] - Authors');
        Writeln('[3] - Exit');
        Writeln('[4] - Mostrar da partida anterior');
        Writeln('[5] - Realizar teste');
        Writeln('---------------------------------'); 
    end;
    procedure views_authors();
    begin
        writeln('Murilo Lindo, Alison feio que é um raio e Gersu tem tantas entradas que parece a 470')
    end;
end.


