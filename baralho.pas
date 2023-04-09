unit baralho;
interface
    uses carta,
        pilha_carta,
        lista_carta;
    function baralho_init():tListaCarta;
    function baralho_embaralha(lista_carta: tListaCarta):tPilhaCarta;

implementation

function baralho_embaralha(lista_carta: tListaCarta):tPilhaCarta;
var pilha_carta:tPilhaCarta;
    carta: tCarta;
    aux:integer;
begin
    inicializarPilhaCarta(pilha_carta, 40);
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
