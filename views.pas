unit views;
interface
uses
    crt,views,baralho,carta,pilha_carta,lista_carta,rodada,pontuacao,util;
    procedure views_menu_main();
    procedure views_authors();
    procedure views_resposta_truco(pode_aumentar: boolean; acao:string);
    procedure views_menu_jogada(rodada:tRodada; mao_usuario:tListaCarta; pontuacao: tPontuacao;ultima_carta:tCarta);
    procedure views_mostra_ganhador_jogada(nome:string);
    procedure views_mostra_carta_jogada(cartaUsuario, cartaMaquina:Tcarta);
    procedure views_inicio_rodada();

implementation
    procedure views_menu_main();
    begin
        Writeln('-----------------------------------');
        Writeln('[1] - Start Game');
        Writeln('[2] - Authors');
        Writeln('[3] - Resultado da partida anterior');
        Writeln('[4] - Exit');
        Writeln('[5] - Realizar teste');
        Writeln('-----------------------------------');
        write(' ');
    end;
    procedure views_authors();
    begin
    		writeln(' ');
        writeln('----------------------------------------------------------------------------------');
        writeln(' Murilo feio que doi, Alison gatao e Gersu tem tantas entradas que parece a 470 ');
        writeln('----------------------------------------------------------------------------------');
        gotoxy(60,20);
        write('Merecemos um 10 :P ');
       
    end;

procedure views_menu_jogada(rodada:tRodada; mao_usuario:tListaCarta; pontuacao: tPontuacao; ultima_carta:tCarta); // add parametros
    begin
         writeln('--------------Placar partida--------------');
         writeln('      | USUARIO: ',pontuacao.pontos_usuario,'  |   MAQUINA: ',pontuacao.pontos_maquina,' |');
         writeln('---------Placar da rodada atual-----------');
         rodada_mostrar_resultado(rodada);
         writeln('---------Informacoes da rodada-----------');
         writeln(' Manilha: ',rodada.manilha);
         writeln(' Peso da rodada: ', rodada_pegar_peso_truco(rodada));
         writeln(' ');
        if not(ultima_carta.poder = 0 ) then begin
          write(' Maquina jogou: ');
          carta_escrever(ultima_carta);
          writeln(' ');
          writeln(' ');
        end;
         writeln('-------------------------------Escolha uma carta-------------------------------');
         escreverListaCarta(mao_usuario);
         writeln(' ');
         writeln();
         if (rodada_jogador_pode_pedir_truco(rodada,'USUARIO')) then begin
          writeln('--------------------------------Outras acoes-----------------------------------');
          if (rodada_pegar_peso_truco(rodada) > 1) then
            writeln(' [4]- Aumentar.')
          else
            writeln(' [4]- pedir truco.');
         end;
         writeln(' ');
         write(' ');
    end;
procedure views_mostra_ganhador_jogada( nome:string);
begin
    writeln();
    Writeln('-------------Resultado da Jogada---------------');
    if not(nome = 'EMPACHE') then
        writeln('                    ',nome,'                      ')
    else
        writeln('                   EMPACHOU');
    writeln();
    writeln('Pressione qualquer tecla para continuar...');

end;

procedure views_mostra_carta_jogada(cartaUsuario, cartaMaquina:Tcarta);
begin
    Writeln('-------------------Cartas---------------------');
    write('Maquina: ');
    carta_escrever(cartaMaquina);
    writeln();
    write('Usuario: ');
    carta_escrever(cartaUsuario);
    writeln();
end;

procedure views_inicio_rodada();
begin
    writeln('------------------------------------------------------------');
    writeln('------------------- Nova rodada iniciada -------------------');
    writeln('------------------------------------------------------------');
end;

procedure views_resposta_truco(pode_aumentar: boolean; acao:string);
begin
  writeln('');
  writeln('---------------------------TRUCO---------------------------');
  writeln(' A maquina ', acao, '!');
  writeln(' ');
  write(' [1]- Aceitar');
  write(' [2]- Correr');
  if (pode_aumentar) then
    write(' [3]- Aumentar');
  writeln();
  writeln('------------------------------------------------------------');
  write(' ');
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


