unit jogada;

interface
uses
    crt,views,baralho,carta,pilha_carta,lista_carta,rodada,pontuacao,util, bot;
    function jogada_iniciar_jogada(rodada:tRodada; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao):String;
    // function jogada_verifica_op(op:integer; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao; rodada:tRodada; jogador:String):String;


implementation


procedure jogada_pedir_truco(var rodada: tRodada; quem_pediu: string);
var pode_aumentar: boolean;
    op, op_maxima: integer;
    quem_responde, acao: string;
begin

  if (rodada_jogador_pode_pedir_truco(rodada, quem_pediu)) then begin
    pode_aumentar:= rodada_pode_aumentar_truco(rodada);
    if (pode_aumentar) then op_maxima:= 3 else op_maxima:= 2;

    if (quem_pediu = 'MAQUINA') then begin
      if (rodada_pegar_peso_truco(rodada) > 1) then acao:= 'aumentou' else acao:= 'pediu truco';
      views_resposta_truco(pode_aumentar, acao);
    end;


    while (( op < 1) or (op > op_maxima)) do begin
      if (quem_pediu = 'USUARIO') then begin
        quem_responde:='MAQUINA';
        op:= bot_decisao_truco();
      end else begin
        read(op);
        quem_responde:='USUARIO';
      end;
    end;

    if (op = 1) then begin
      rodada_aumentar_peso_truco(rodada, quem_pediu);
        writeln(' ');
//      writeln(' Truco aumentado!');
        writeln(inverte_jogador(quem_pediu), ' - Truco Aceito!');
    end else if (op = 2) then begin
      writeln(' ');
      writeln(inverte_jogador(quem_pediu), ' - Correu!');
      rodada_adicionar_arregao(rodada, quem_responde)
      //Fazer rodada terminar
    end else if (op = 3) then begin
      writeln(' ');
      writeln(inverte_jogador(quem_pediu), ' - Aumentou!');
//			writeln(' Aumentar');
      writeln(' ');
      rodada_aumentar_peso_truco(rodada, quem_pediu);
      jogada_pedir_truco(rodada, inverte_jogador(quem_pediu));
    end;

		delay(1500);
   end else begin
      writeln('O truco nao pode aumentar mais');
  end;
end;

function jogada_escolhe_carta(jogador: string; var rodada:tRodada; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao; carta: tCarta):integer;
var op, max_op_carta: integer;
    escolheu_op: boolean;
begin
  escolheu_op:= false;
  while(not escolheu_op ) do begin
    clrscr();

    // Se for o usuario, mostra a view e da um read na opcao;
    if (jogador = 'USUARIO') then begin
      views_menu_jogada(rodada, mao_usuario, pontuacao, carta);
      read(op);
    end else begin
      // Se for a maquina, pede pra ela escolher a oção;
      op:=bot_escolhe_acao(carta, pontuacao, mao_maquina);
    end;

    if (((op = 4) or pontuacao_esta_mao_onze(pontuacao, inverte_jogador(jogador))) and (rodada_jogador_pode_pedir_truco(rodada, jogador))) then begin
      if (jogador = 'MAQUINA') then
        views_menu_jogada(rodada, mao_usuario, pontuacao, carta);
        jogada_pedir_truco(rodada, jogador);
        if not (rodada.arregao = 'NINGUEM') then begin
          escolheu_op:= true;
          op := 2;
        end;
    end else begin
      //Se foi escolhido uma opção que seja pedir truco, é validado se essa opção corresponde a uma carta do mao do jogador;
      if (jogador = 'USUARIO') then
        max_op_carta:= mao_usuario.qtd
      else
        max_op_carta:= mao_maquina.qtd;

      if ((op >= 1) and (op <= max_op_carta)) then
        escolheu_op:= true; // Sai do loop
    end;
  end;
  jogada_escolhe_carta:= op;

end;

function jogada_verifica_carta_mais_forte(cartaUsuario, cartaMaquina: tCarta):String;
var poderCartaUsuario,poderCartaMaquina:integer;
begin

    poderCartaUsuario := carta_redefine_poder_sem_nipe_integer(cartaUsuario);
    poderCartaMaquina := carta_redefine_poder_sem_nipe_integer(cartaMaquina);
    if(poderCartaUsuario > poderCartaMaquina) then
        jogada_verifica_carta_mais_forte := 'USUARIO'
    else if(poderCartaUsuario < poderCartaMaquina) then
        jogada_verifica_carta_mais_forte := 'MAQUINA'
    else
        jogada_verifica_carta_mais_forte := 'EMPACHE';
end;

function jogada_verifica_se_teve_arregao(var rodada:tRodada):boolean;
begin
  with rodada do begin
  if not (arregao = 'NINGUEM') then
    jogada_verifica_se_teve_arregao:=true
  else
    jogada_verifica_se_teve_arregao:=false;

  end;
end;

{RETORNA: MAQUINA, USUARIO, NINGUEM, EMPACHE e ARREGAO }
function jogada_iniciar_jogada(var rodada:tRodada;var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao):String;
var op, i:integer;
    carta, cartaUsuario, cartaMaquina: tCarta;
    quemComeca, ganhador:string;
    escolheu_op: boolean;
begin
    op:=0;
    quemComeca := rodada_quem_comeca(rodada);
    op:= jogada_escolhe_carta(quemComeca, rodada, mao_usuario, mao_maquina, pontuacao, carta);

  if not((jogada_verifica_se_teve_arregao(rodada))) then
    if (quemComeca = 'USUARIO') then begin
      cartaUsuario:= removerDaListaCartaPorPosicao(op, mao_usuario);

      op:= jogada_escolhe_carta('MAQUINA', rodada, mao_usuario, mao_maquina, pontuacao, cartaUsuario);
        if NOT(jogada_verifica_se_teve_arregao(rodada)) then begin
          cartaMaquina := removerDaListaCartaPorPosicao(op, mao_maquina);
      end
    end else begin
      cartaMaquina:= removerDaListaCartaPorPosicao(op, mao_maquina);
      op:= jogada_escolhe_carta('USUARIO', rodada, mao_usuario, mao_maquina, pontuacao, cartaMaquina);
      if NOT(jogada_verifica_se_teve_arregao(rodada)) then
        cartaUsuario := removerDaListaCartaPorPosicao(op, mao_usuario);
    end;

    if NOT(jogada_verifica_se_teve_arregao(rodada)) then begin
      clrscr;
      views_mostra_carta_jogada(cartaUsuario, cartaMaquina);
      jogada_iniciar_jogada := jogada_verifica_carta_mais_forte(cartaUsuario,cartaMaquina);
    end else
      jogada_iniciar_jogada:= 'ARREGAO';

    // Retorna o ganhador;
    // jogada_iniciar_jogada := jogada_verifica_op(op, mao_usuario, mao_maquina, pontuacao, rodada, quemComeca);
end;

end.