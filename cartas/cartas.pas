unit carta;

interface
 type
    Tcarta = record
      poder: integer;
      tipo: char;
      num: integer;
      nipe: integer;
    end;

function carta_define_poder(pod, num, nipe:integer; tipo:char):integer;
function carta_criar(num, nipe:integer):Tcarta;

implementation

function carta_criar(num, nipe:integer):Tcarta;
var carta: Tcarta;
begin 
    carta.poder := carta_define_poder(0, num, nipe, 'N');
    carta.tipo  := 'N';
    carta.num   := num;
    carta.nipe  := nipe;

    carta_criar := carta;
end

{Valor do nipe       = 4 - paus 3 - copas 2 - espadas 1 - molao }
{Poder por num carta = 3 - (10), 2 - (9), 1 - (8), 12 - (7), 11 - (6), 10 - (5),7 - (4),6 - (3),5 - (2),4 -(1)}
function carta_define_poder(pod, num, nipe:integer; tipo:char):integer
var poder: integer
begin
     // poder bruto
 
     if ((tipo:= 'N') and (pod = 0)) then 
     begin
     case num of
          3:  poder:= 10*4;
          2:  poder:= 9*4;
          1:  poder:= 8*4;
          12: poder:= 7*4;
          11: poder:= 6*4;
          10: poder:= 5*4;
          7:  poder:= 4*4;
          6:  poder:= 3*4;
          5:  poder:= 2*4;
          4:  poder:= 1*4;
     end;
       poder :=(poder+nipe)-4;
        carta_define_poder:=poder;
    end
    else if(tipo = 'C') then  // C = coringa
        carta_define_poder:=pod+100
    else 
         carta_define_poder:=pod;
end


End.