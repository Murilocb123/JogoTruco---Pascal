unit baralho;
interface
    uses carta,
        pilha_carta,
        lista_carta;
    function baralho_init():tListaCarta;
    function baralho_embaralha(lista_carta: tListaCarta):tPilhaCarta;
    {funcao para realizar o corte usando somente pilhas, pilha_carta_aux1 usada para armazenar o montante cortado e inserir em baixo da pilha}
    function baralho_realiza_corte(posi_corte:integer; var baralho_pilha_embaralhado:tPilhaCarta):integer;
    procedure baralho_distrubui_cartas( var mao_jogador1, mao_jogador2:tListaCarta; var baralho_pilha_cortado:tPilhaCarta; var manilha:integer);
    function baralho_define_manilha(num:integer):integer;

implementation

procedure baralho_distrubui_cartas(var mao_jogador1,  mao_jogador2:tListaCarta; var baralho_pilha_cortado:tPilhaCarta; var manilha:integer);
var carta:tCarta;
    i, j:integer;
begin
    carta:=recuperarValorPilhaCartaPorPosicao(baralho_pilha_cortado.qtd-6,baralho_pilha_cortado);
    manilha := baralho_define_manilha(carta.num);
    j:=baralho_pilha_cortado.qtd-6;
    while (baralho_pilha_cortado.qtd > j ) do begin
        i:= baralho_pilha_cortado.qtd;
        carta:=removerDaPilhaCarta(baralho_pilha_cortado);
        carta_verifica_manilha(carta, manilha);
        if((i mod 2) =0) then
            inserirNaListaCarta(carta, mao_jogador1)
        else
            inserirNaListaCarta(carta, mao_jogador2);
    end;
end;

function baralho_define_manilha(num:integer):integer;
begin
    if (num = 7) then
        baralho_define_manilha := 10
    else if(num = 12) then
        baralho_define_manilha := 1
    else 
        baralho_define_manilha := num+1;
end;

{funcao para realizar o corte usando somente pilhas, pilha_carta_aux1 usada para armazenar o montante cortado e inserir em baixo da pilha}
function baralho_realiza_corte(posi_corte:integer; var baralho_pilha_embaralhado:tPilhaCarta):integer;
var pilha_carta_aux1, pilha_carta_aux2: tPilhaCarta;
    carta:tCarta;
    i:integer;
begin
    inicializarPilhaCarta(pilha_carta_aux1, baralho_pilha_embaralhado.qtd);
    inicializarPilhaCarta(pilha_carta_aux2, baralho_pilha_embaralhado.qtd);
    if ((posi_corte < 1) or (posi_corte >(baralho_pilha_embaralhado.qtd-1))) then begin
        baralho_realiza_corte := 0;
        writeln('Erro ao realizar o corte fora dos limite do baralho!');
    end else begin
        while(baralho_pilha_embaralhado.qtd > 0) do 
        begin
            if (baralho_pilha_embaralhado.qtd >= posi_corte) then begin
                carta := removerDaPilhaCarta(baralho_pilha_embaralhado);
                inserirNaPilhaCarta(carta,pilha_carta_aux1);
            end else begin
                carta := removerDaPilhaCarta(baralho_pilha_embaralhado);
                inserirNaPilhaCarta(carta,pilha_carta_aux2);
            end;
        end;  
        while (baralho_pilha_embaralhado.qtd < baralho_pilha_embaralhado.max) do 
        begin
            if(pilha_carta_aux1.qtd > 0) then begin
                carta := removerDaPilhaCarta(pilha_carta_aux1);
                inserirNaPilhaCarta(carta, baralho_pilha_embaralhado); 
            end else begin
                carta := removerDaPilhaCarta(pilha_carta_aux2);
                inserirNaPilhaCarta(carta, baralho_pilha_embaralhado); 
            end;
        end;
        baralho_realiza_corte := 1;
    end;
end;

function baralho_embaralha(lista_carta: tListaCarta):tPilhaCarta;
var pilha_carta:tPilhaCarta;
    carta: tCarta;
    aux:integer;
begin
    inicializarPilhaCarta(pilha_carta, lista_carta.qtd);
    while not (lista_carta.qtd = 0) do
    begin
        aux := random(lista_carta.qtd)+1;
      	if (lista_carta.qtd = 1) then
      		aux:=1;
        carta := removerDaListaCartaPorPosicao(aux, lista_carta);
        inserirNaPilhaCarta(carta, pilha_carta);
    end;
    baralho_embaralha:=pilha_carta
end;

{Inicializa o baralho criando as cartas}
function baralho_init():tListaCarta;
var i, j:integer;
    listaCarta:tListaCarta;
    carta:tCarta;
begin
    inicializarListaCarta(listaCarta, 40);
    i:=1;
    while(i<=12) do
    begin
        if (i=8) then // pula o 8 e o nove
            i:= i+2;
        for j := 1 to 4 do
        begin
            carta := carta_criar(i,j);
            inserirNaListaCarta(carta,listaCarta);
        end;
        i:=i+1;
    end;
    baralho_init:=listaCarta; 
end;

End.
