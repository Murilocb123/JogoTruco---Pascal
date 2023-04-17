unit jogada;
    
interface
uses
    crt,views,baralho,carta,pilha_carta,lista_carta,rodada,pontuacao,util, bot;
    function jogada_iniciar_jogada(rodada:tRodada; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao):String;
    function jogada_verifica_op(op:integer; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao; rodada:tRodada; jogador:String):String;

    
implementation
function jogada_iniciar_jogada(var rodada:tRodada;var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao):String;
var op, i:integer;
    carta: tCarta;
    quemComeca:string;
begin
    op:=0;
    quemComeca := rodada_quem_comeca(rodada);
    writeln('quem comeca: ' , quemComeca);
    if(quemComeca = 'USUARIO')then begin
       while((op  < 1) or (op > 4)) do begin
        views_menu_jogada(rodada, mao_usuario, pontuacao, carta);
        read(op);
       end;
        jogada_iniciar_jogada := jogada_verifica_op(op, mao_usuario, mao_maquina, pontuacao, rodada, 'USUARIO');
    end else begin
        op:=bot_escolhe_acao(carta, pontuacao, mao_maquina, 0);
        jogada_iniciar_jogada := jogada_verifica_op(op, mao_usuario, mao_maquina, pontuacao, rodada, 'MAQUINA');   
    end; 
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

function jogada_verifica_op(op:integer; var mao_usuario, mao_maquina:tListaCarta; pontuacao: tPontuacao; rodada:tRodada; jogador:String):String;
var cartaUsuario, cartaMaquina:tCarta;
begin
    if (jogador = 'USUARIO') then begin
        if((op >= 1) and (op <=3)) then 
            cartaUsuario:= removerDaListaCartaPorPosicao(op, mao_usuario); 
        op:=bot_escolhe_acao(cartaUsuario, pontuacao, mao_maquina, 0);
        if((op >= 1) and (op <=3)) then
            cartaMaquina := removerDaListaCartaPorPosicao(op, mao_maquina);
        clrscr();
        views_mostra_carta_jogada(cartaMaquina, 'MAQUINA'); 
        delay(2000);
    end else begin

        if((op >= 1) and (op <=3)) then 
            cartaMaquina:= removerDaListaCartaPorPosicao(op, mao_maquina);
        views_menu_jogada(rodada, mao_usuario, pontuacao, cartaMaquina);
        read(op);
        if((op >= 1) and (op <=3)) then
            cartaUsuario := removerDaListaCartaPorPosicao(op, mao_usuario);   
    end;
    jogada_verifica_op := jogada_verifica_carta_mais_forte(cartaUsuario,cartaMaquina);
    
end;


end.