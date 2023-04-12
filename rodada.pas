unit rodada;

interface
uses carta, util;

type tRodada = record
  jogadas_vencedor: array[1..3] of string; //MAQUINA, USUARIO, EMPACHE
  jogada_atual: integer;
end;

function rodada_jogador_ganhou(rodada: tRodada; jogador: string): boolean;
function rodada_finalizada(rodada: tRodada): boolean;
function rodada_jogador_ganhador(rodada: tRodada): string;
function rodada_quem_comeca(rodada: tRodada): string;
procedure rodada_inicializar(rodada: tRodada);
procedure rodada_adicionar_resultado(rodada: tRodada; resultado: string);
procedure rodada_mostrar_resultado(rodada: tRodada);


implementation

procedure rodada_inicializar(var rodada: tRodada);
begin
  with rodada do begin
    jogadas_vencedor[1]:= '';
    jogadas_vencedor[2]:= '';
    jogadas_vencedor[3]:= '';
    jogada_atual:= 1;
  end;
end;

function rodada_jogador_ganhou(rodada: tRodada; jogador: string): boolean;
var ganhou: boolean;
begin
  ganhou:= false;
  // Sequencia de possiveis combinações para tal jogador ganhar;
  with rodada do begin

    {Possiveis situacoes de vencimento:
    Combinação 1	Combinação 2	Combinação 3	Combinação 4	Combinação 5 Combinacao 6 Combinacao 7 Combinacao 8
    JOGADOR	      JOGADOR	      JOGADOR	      EMPACHE	      MAQUINA      EMPACHE      EMPACHE      JOGADOR
    JOGADOR	      EMPACHE	      MAQUINA	      JOGADOR	      JOGADOR      EMPACHE      EMPACHE      MAQUINA
                                JOGADOR                     JOGADOR      JOGADOR      EMPACHE      EMPACHE

    Venceu!	      Venceu!	      Venceu!	      Venceu!	      Venceu!      Venceu!      Ninguem      Venceu!
    }

    if ((jogadas_vencedor[1] = jogador) and (jogadas_vencedor[2] = jogador) ) then //Combincao 1
      ganhou:= true
    else if ((jogadas_vencedor[1] = jogador) and (jogadas_vencedor[2] = 'EMPACHE')) then //Combinacao 2
      ganhou:= true
    else if ((jogadas_vencedor[1] = jogador) and (jogadas_vencedor[3] = jogador)) then //Combinacao 3
      ganhou:= true
    else if ((jogadas_vencedor[1] = 'EMPACHE') and (jogadas_vencedor[2] = jogador)) then //Combinacao 4
      ganhou:= true
    else if ((jogadas_vencedor[2] = jogador) and (jogadas_vencedor[3] = jogador)) then //Combinacao 5
      ganhou:= true
    else if ((jogadas_vencedor[1] = 'EMPACHE') and (jogadas_vencedor[2] = 'EMPACHE') and (jogadas_vencedor[3] = jogador)) then //Combinacao 6
      ganhou:= true
    else if ((jogadas_vencedor[1] = 'EMPACHE') and (jogadas_vencedor[2] = 'EMPACHE') and (jogadas_vencedor[3] = 'EMPACHE')) then //Combinacao 7
      ganhou:= false
    else if ((jogadas_vencedor[1] = jogador) and (jogadas_vencedor[3] = 'EMPACHE')) then //Combinacao 7
      ganhou:= true

    //Se a primeira jogadas_vencedor foi o jogador que ganhou
    // if ((jogadas_vencedor[1] = jogador) and (
    //     (jogadas_vencedor[2] = jogador) or
    //     (jogadas_vencedor[2] = 'EMPACHE') or
    //     (jogadas_vencedor[3] = jogador))) then
    //       ganhou:= true
    // else if ((jogadas_vencedor[1] = 'EMPACHE') and (jogadas_vencedor[2] = jogador)) then
    //     ganhou:= true
    // else if ((jogadas_vencedor[3] = jogador) ) then
    //     ganhou:= true
    // else if ((jogadas_vencedor[3] = 'EMPACHE') and (jogadas_vencedor[1] = jogador))
    //     ganhou:= true

  end;
  rodada_jogador_ganhou:= ganhou;
end;

function rodada_finalizada(rodada: tRodada): boolean;
begin
  rodada_finalizada:= ((rodada.jogada_atual > 3) or (rodada_jogador_ganhador(rodada) <> 'NINGUEM'));
end;

function rodada_jogador_ganhador(rodada: tRodada): string;
begin
  if (rodada_jogador_ganhou(rodada, 'MAQUINA')) then
    rodada_jogador_ganhador:= 'MAQUINA'
  else if (rodada_jogador_ganhou(rodada, 'USUARIO')) then
    rodada_jogador_ganhador:= 'USUARIO'
  else
    rodada_jogador_ganhador:= 'NINGUEM'
end;

function rodada_quem_comeca(rodada: tRodada): string;
var i, j: integer;
begin
  with rodada do begin
    i:= 2;
    while ( (i > 0) and ((jogadas_vencedor[i] = '' ) or (jogadas_vencedor[i] = 'EMPACHE'))) do begin
      dec(i)
    end;

    if (i > 1 ) then
      rodada_quem_comeca:= jogadas_vencedor[i]
    else if not('NINGUEM' = 'NINGUEM') then
      rodada_quem_comeca:= 'USUARIO'
    else begin
      j:= aleatorioEntre(1,2);
      if (j = 1) then
        rodada_quem_comeca:= 'MAQUINA'
      else
        rodada_quem_comeca:= 'USUARIO'
    end;

  end;
end;

procedure rodada_adicionar_resultado(var rodada: tRodada; resultado: string);
begin
  with rodada do begin
    jogadas_vencedor[jogada_atual]:= resultado;
    inc(jogada_atual);
  end;
end;

procedure rodada_mostrar_resultado(rodada: tRodada);
begin
  with rodada do begin
    writeln('--------------------------');
    writeln('-------RODADA ATUAL-------');
    writeln('[1] ', jogadas_vencedor[1]);
    writeln('[2] ', jogadas_vencedor[2]);
    writeln('[3] ', jogadas_vencedor[3]);
    writeln('Jogada atual: ', jogada_atual);
    writeln('--------------------------')
  end;
end;

end.