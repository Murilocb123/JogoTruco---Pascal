unit baralho
interface
uses carta,
     pilha_carta,
     lista_carta;

function baralho_embaralha():tPilhaCarta;

implementation

function baralho_embaralha():tPilhaCarta;
var
begin

end;

{Inicializa o baralho criando as cartas}
function baralho_init():tListaCarta;
var i, j:integer;
    listaCarta:tListaCarta;
    carta:tCarta;
begin
    inicializarListaCarta(listaCarta, 40);
    while(i<=12) do
    begin
        i:=i+1;
        if (i=8) then // pula o 8 e o nove
            i:= i+2;
        for j := 1 to 4 do
        begin
            carta := carta_criar(i,j);
            inserirNaListaCarta(carta,listaCarta);
        end;
    end;  
end;

End.
