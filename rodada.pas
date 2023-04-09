unit rodada;

interface
uses carta;

type tRodada = record
  jogadas_vendedor: array[1..3] of string; //MAQUINA, USUARIO, EMPACHE
end;

implementation

function rodada_nenhum_ganhador(rodada: tRodada): boolean;
begin
  rodada_nenhum_ganhador:= not((rodada_jogador_ganhou('MAQUINA')) or (rodada_jogador_ganhou('MAQUINA')))
end;

function rodada_jogador_ganhou(rodada: tRodada; jogador: string): boolean;
var ganhou: boolean;
begin
  ganhou:= false;
  // Sequencia de possiveis combinações para tal jogador ganhar;
  with rodada do begin

    {Possiveis situacoes de vencimento:
    Combinação 1	Combinação 2	Combinação 3	Combinação 4	Combinação 5

    JOGADOR	      JOGADOR	      JOGADOR	      EMPACHE	      MAQUINA
    JOGADOR	      EMPACHE	      MAQUINA	      JOGADOR	      JOGADOR
                                JOGADOR                     JOGADOR
    Venceu!	      Venceu!	      Venceu!	      Venceu!	      Venceu!
    }
    //Se a primeira rodada foi o jogador que ganhou
    if ((rodada[1] = jogador) and (
        (rodada[2] = jogador) or
        (rodada[2] = 'EMPACHE') or
        (rodada[3] = jogador)) ) then
        ganhou:= true
    else if ((rodada[1] = 'EMPACHE') and (rodada[2] = jogador)) then
        ganhou:= true
    else if ( (rodada[2] = jogador) and (rodada[3] = jogador) ) then
        ganhou:= true

  end;
  rodada_jogador_ganhou:= ganhou;
end;

end.