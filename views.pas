unit views;
interface
    procedure views_menu_main();
    procedure views_authors();
    procedure views_menu_jogada();

implementation
    procedure views_menu_main();
    begin
        Writeln('---------------------------------');
        Writeln('[1] - Start Game');
        Writeln('[2] - Authors');
        Writeln('[3] - Mostrar da partida anterior');
        Writeln('[4] - Exit');
        Writeln('[5] - Realizar teste');
        Writeln('---------------------------------');
    end;
    procedure views_authors();
    begin
        writeln('Murilo feito que doi, Alison gatão e Gersu tem tantas entradas que parece a 470')
    end;

// procedure views_menu_jogada(); // add parametros
//     begin
//         writeln(' --------------Placar partida-------------');
//          writeln('       | USUARIO: 10 | MAQUINA: 6 |');
//          writeln('  -------------Placar por rodada----------- ');
//          writeln('   1 - Jogador');
//          writeln('   2 - Maquina');
//          writeln('   3 - Empache');
//          writeln('   ---------Informações da rodada-----------');
//          writeln('   Manilha: 10');
//          writeln('   ------------Escolha uma carta------------');
//          writeln('   [1] - CARTA 1 [2] - CARTA 2 [3] - CARTA 3') ;
//          writeln('   -------------Outras ações---------------');
//          writeln('   [4]- pedir truco.');
//     end;

// procedure views_menu_jogada_resp_truco();// add parametros
//     begin
//         writeln(' --------------Placar partida-------------');
//          writeln('       | USUARIO: 10 | MAQUINA: 6 |');
//          writeln('  -------------Placar por rodada----------- ');
//          writeln('   1 - Jogador');
//          writeln('   2 - Maquina');
//          writeln('   3 - Empache');
//          writeln('   ---------Informações da rodada-----------');
//          writeln('   Manilha: 10');
//          writeln('   Valor da rodada: 1');
//          writeln('   ------------Suas  carta------------');
//          writeln('   CARTA 1 | CARTA 2| CARTA 3') ;
//          writeln('   -------------Escolha as ações---------------');
//          if not (valor_rodada < 12) then
//             writeln('   [5]- Correr. [6]- Aceitar [7]- Aumentar 3');
//          else
//             writeln('  [5]- Correr. [6]- Aceitar')

//     end;
end.


