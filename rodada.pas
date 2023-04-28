unit rodada;

interface
uses carta, util, pontuacao;

type tRodada = record
  jogadas_vencedor: array[1..3] of string; //MAQUINA, USUARIO, EMPACHE
  jogada_atual: integer;
  manilha:integer;
  ultimo_comecou:String;
  peso_truco: integer;
  peso_maximo_truco: integer;
  ultimo_aumentou_truco: String;
  arregao: String;
end;

function rodada_jogador_ganhou(rodada: tRodada; jogador: string): boolean;
function rodada_finalizada(rodada: tRodada): boolean;
function rodada_jogador_ganhador(rodada: tRodada): string;
function rodada_quem_comeca(rodada: tRodada): string;
procedure rodada_inicializar(var rodada: tRodada; pontuacao: tPontuacao);
procedure rodada_adicionar_resultado(rodada: tRodada; resultado: string);
procedure rodada_adicionar_resultado_final(var rodada: tRodada);
procedure rodada_adicionar_arregao(var rodada: tRodada; arre:string);
procedure rodada_mostrar_resultado(rodada: tRodada);
procedure rodada_adicionar_manilha(rodada: tRodada; manilha_valor:integer);
function rodada_pode_aumentar_truco(rodada: tRodada): boolean;
procedure rodada_aumentar_peso_truco(var rodada: tRodada; quem_aumentou: string);
function rodada_pegar_peso_truco(rodada: tRodada): integer;
function rodada_jogador_pode_pedir_truco(rodada: tRodada; jogador: string):boolean;


implementation

procedure rodada_inicializar(var rodada: tRodada; pontuacao: tPontuacao);
begin
  with rodada do begin
    jogadas_vencedor[1]:= '';
    jogadas_vencedor[2]:= '';
    jogadas_vencedor[3]:= '';
    jogada_atual:= 1;
    manilha:=0;
    peso_truco:= 1;
    peso_maximo_truco:= (pontuacao_quanto_falta_pro_perderdor_ganhar(pontuacao));
    ultimo_aumentou_truco:= 'NINGUEM';
    arregao:='NINGUEM';
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

    if (i >= 1 ) then
    if (jogadas_vencedor[i] = 'EMPACHE' ) then
    rodada_quem_comeca:=ultimo_comecou
    else
    rodada_quem_comeca:= jogadas_vencedor[i]
    else if(ultimo_comecou = '') then begin
      j:= aleatorioEntre(1,2);
      if (j = 1) then
      begin
        ultimo_comecou:='MAQUINA';
        rodada_quem_comeca:= 'MAQUINA';
      end else begin
        rodada_quem_comeca:= 'USUARIO';
        ultimo_comecou:='USUARIO';
      end;
    end else begin
      if (ultimo_comecou='USUARIO') then
      ultimo_comecou := 'MAQUINA'
      else
      ultimo_comecou := 'USUARIO';
      rodada_quem_comeca :=ultimo_comecou;
    end
  end;
end;

procedure rodada_adicionar_resultado(var rodada: tRodada; resultado: string);
begin
  with rodada do begin
    jogadas_vencedor[jogada_atual]:= resultado;
    inc(jogada_atual);
  end;
end;

procedure rodada_adicionar_resultado_final(var rodada: tRodada);
var vencedor:string;
begin
  with rodada do begin
    if (arregao ='USUARIO') then
    vencedor:= 'MAQUINA'
    else
    vencedor:='USUARIO';
    jogadas_vencedor[1]:= vencedor;
    jogadas_vencedor[2]:= vencedor;
    jogadas_vencedor[3]:= vencedor;
    inc(jogada_atual);
  end;
end;

procedure rodada_mostrar_resultado(rodada: tRodada);
begin
  with rodada do begin
    if (arregao <> 'NINGUEM') then begin
      writeln(arregao, ' correu!')
    end else begin
      writeln('1 - ', jogadas_vencedor[1]);
      writeln('2 - ', jogadas_vencedor[2]);
      writeln('3 - ', jogadas_vencedor[3]);
      writeln(' ');
    end;
  end;
end;

procedure rodada_adicionar_manilha(var rodada: tRodada; manilha_valor:integer);
begin
  with rodada do
  manilha := manilha_valor;
end;

function rodada_pode_aumentar_truco(rodada: tRodada): boolean;
begin
  with rodada do begin
    rodada_pode_aumentar_truco:= (peso_truco + 3 <= peso_maximo_truco);
  end;
end;

function rodada_jogador_pode_pedir_truco(rodada: tRodada; jogador: string):boolean;
begin
  with rodada do begin
    if ((ultimo_aumentou_truco = jogador) or (peso_truco >= peso_maximo_truco)) then
    rodada_jogador_pode_pedir_truco:= false
    else
    rodada_jogador_pode_pedir_truco:= true;
  end;
end;

procedure rodada_aumentar_peso_truco(var rodada: tRodada; quem_aumentou: string);
begin
  with rodada do begin
    if (peso_truco = 1) then
    peso_truco:= 3
    else
    peso_truco:= peso_truco + 3;
    if (peso_truco > 12) then
    peso_truco:= 12;

    arregao:= 'NINGUEM';
    ultimo_aumentou_truco:= quem_aumentou;
  end;
end;

function rodada_pegar_peso_truco(rodada: tRodada): integer;
begin
  with rodada do begin
    rodada_pegar_peso_truco:= peso_truco;
  end;
end;

procedure rodada_adicionar_arregao(var rodada: tRodada; arre:string);
begin
  with rodada do begin
    arregao:= arre;
  end
end;

end.