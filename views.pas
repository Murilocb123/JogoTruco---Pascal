unit views;
interface
uses
    crt,views,baralho,carta,pilha_carta,lista_carta,rodada,pontuacao,util;
    procedure views_menu_main();
    procedure views_authors();
    procedure views_menu_jogada(rodada:tRodada; mao_usuario:tListaCarta; pontuacao: tPontuacao;ultima_carta:tCarta);
    procedure views_mostra_ganhador_jogada(nome:string);
    procedure views_mostra_carta_jogada(carta:Tcarta; nome:String);
    procedure views_inicio_rodada();

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

procedure views_menu_jogada(rodada:tRodada; mao_usuario:tListaCarta; pontuacao: tPontuacao; ultima_carta:tCarta); // add parametros
    begin
         writeln('--------------Placar partida-------------');
         writeln('   | USUARIO: ',pontuacao.pontos_usuario,' | MAQUINA: ',pontuacao.pontos_maquina,' |');
         writeln('---------Placar da rodada atual---------- ');
         rodada_mostrar_resultado(rodada);
         writeln('---------Informacoes da rodada-----------');
         writeln(' Manilha: ',rodada.manilha);
         write(' Ultima Jogada: ');
         if not(ultima_carta.poder = 0 ) then
            carta_escrever(ultima_carta);
         writeln();
         writeln('------------Escolha uma carta------------');
         escreverListaCarta(mao_usuario);
         writeln();
         writeln('-------------Outras acoes---------------');
         writeln(' [4]- pedir truco.');
    end;
procedure views_mostra_ganhador_jogada( nome:string);
begin
    Writeln('-------------Resultado da Jogada---------------');
    if not(nome = 'EMPACHE') then
        writeln('              ',nome,'                      ')   
    else
        writeln('              Empachou')
end;

procedure views_mostra_carta_jogada(carta:Tcarta; nome:String);
begin 
    write('Carta jogada pelo(a) ',nome,': ');
    carta_escrever(carta);
    writeln();
end;

procedure views_inicio_rodada();
begin 
    writeln('------------------------------------------------------------');
    writeln('------------------- Nova rodada iniciada -------------------');
    writeln('------------------------------------------------------------');
end;


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


