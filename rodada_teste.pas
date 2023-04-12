Program rodada_teste;
uses rodada, carta;

var
  rodada: tRodada;

procedure mostrar_resultado(rodada: tRodada);
begin
  rodada_mostrar_resultado(rodada);
  if ( not(rodada_finalizada(rodada)) ) then begin
    writeln('Rodada finalizada: ', rodada_finalizada(rodada) );
    writeln('Rodada jogador quem comeca: ', rodada_quem_comeca(rodada) );
  end else
    writeln('Ganhador: ', rodada_jogador_ganhador(rodada) );

end;

begin

rodada_inicializar(rodada); //OK

writeln('Rodada finalizada: ', rodada_finalizada(rodada) ); //OK
writeln('Rodada jogador ganhou MAQUINA: ', rodada_jogador_ganhou(rodada, 'MAQUINA') );
writeln('Rodada jogador ganhou USUARIO: ', rodada_jogador_ganhou(rodada, 'USUARIO') );
writeln('Rodada jogador quem ganhou: ', rodada_jogador_ganhador(rodada) );
writeln('Rodada jogador quem comeca: ', rodada_quem_comeca(rodada) );

writeln('Combinacao 1');
rodada_adicionar_resultado(rodada, 'MAQUINA');
rodada_adicionar_resultado(rodada, 'MAQUINA');
mostrar_resultado(rodada);
writeln('--------------------------------------');

writeln('Combinacao 2');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'MAQUINA');
rodada_adicionar_resultado(rodada, 'EMPACHE');
mostrar_resultado(rodada);
writeln('--------------------------------------');

writeln('Combinacao 3');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'MAQUINA');
rodada_adicionar_resultado(rodada, 'USUARIO');
rodada_adicionar_resultado(rodada, 'MAQUINA');
mostrar_resultado(rodada);
writeln('--------------------------------------');

writeln('Combinacao 4');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'EMPACHE');
rodada_adicionar_resultado(rodada, 'MAQUINA');
mostrar_resultado(rodada);
writeln('--------------------------------------');


writeln('Combinacao 5');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'USUARIO');
rodada_adicionar_resultado(rodada, 'MAQUINA');
rodada_adicionar_resultado(rodada, 'MAQUINA');
mostrar_resultado(rodada);
writeln('--------------------------------------');


writeln('Combinacao 6');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'EMPACHE');
rodada_adicionar_resultado(rodada, 'EMPACHE');
rodada_adicionar_resultado(rodada, 'MAQUINA');
mostrar_resultado(rodada);
writeln('--------------------------------------');


writeln('Combinacao 7');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'EMPACHE');
rodada_adicionar_resultado(rodada, 'EMPACHE');
rodada_adicionar_resultado(rodada, 'EMPACHE');
mostrar_resultado(rodada);
writeln('--------------------------------------');

writeln('Combinacao 8');
rodada_inicializar(rodada); //OK
rodada_adicionar_resultado(rodada, 'MAQUINA');
rodada_adicionar_resultado(rodada, 'USUARIO');
rodada_adicionar_resultado(rodada, 'EMPACHE');
mostrar_resultado(rodada);
writeln('--------------------------------------');

end.