unit carta;

interface
type
tCarta = record
  poder: integer;
  tipo: char;
  num: integer;
  nipe: integer;
end;

function carta_define_poder(pod, num, nipe:integer; tipo:char):integer;
function carta_criar(num, nipe:integer):Tcarta;
procedure carta_escrever(carta: tCarta);
procedure carta_verifica_manilha(var carta:tCarta; manilha:integer);
procedure carta_redefine_poder_sem_nipe(var carta:tCarta);
function carta_redefine_poder_sem_nipe_integer(var carta:tCarta):integer;
procedure carta_escrever_com_poder(carta: tCarta);

implementation

function carta_criar(num, nipe:integer):tCarta;
var carta: Tcarta;
begin
  carta.poder := carta_define_poder(0, num, nipe, 'N');
  carta.tipo  := 'N';
  carta.num   := num;
  carta.nipe  := nipe;
  
  carta_criar := carta;
end;

procedure carta_verifica_manilha(var carta:tCarta; manilha:integer);
begin
  with carta do
  begin
    if (num = manilha) then begin
      tipo:='C';
      
      poder:= carta_define_poder(poder, num, nipe,tipo);
    end
  end;
end;

{Valor do nipe       = 4 - paus 3 - copas 2 - espadas 1 - moles}
{Poder por num carta = 3 - (10), 2 - (9), 1 - (8), 12 - (7), 11 - (6), 10 - (5),7 - (4),6 - (3),5 - (2),4 -(1)}
function carta_define_poder(pod, num, nipe:integer; tipo:char):integer;
var poder: integer;
begin
  // poder bruto
  
  if ((tipo = 'N') and (pod = 0)) then
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
  else if(tipo = 'C') then  // C = manilha
  carta_define_poder:=40+nipe
  else
  carta_define_poder:=pod;
end;

procedure carta_escrever(carta: tCarta);
var nipe_descricao: array[1..4] of string;
tipo_descricao: string;
begin
  
  nipe_descricao[4] := 'Paus';
  nipe_descricao[3] := 'Copas';
  nipe_descricao[2] := 'Espadas';
  nipe_descricao[1] := 'Moles';
  
  if carta.tipo = 'N' then
  tipo_descricao:= 'Normal'
  else
  tipo_descricao:= 'Manilha';
  
  with carta do
  write( num, ' de ', nipe_descricao[nipe], ' - ', tipo_descricao)
end;

procedure carta_escrever_com_poder(carta: tCarta);
var nipe_descricao: array[1..4] of string;
tipo_descricao: string;
begin
  
  nipe_descricao[4] := 'Paus';
  nipe_descricao[3] := 'Copas';
  nipe_descricao[2] := 'Espadas';
  nipe_descricao[1] := 'Moles';
  
  if carta.tipo = 'N' then
  tipo_descricao:= 'Normal'
  else
  tipo_descricao:= 'manilha';
  
  with carta do
  writeln('[', poder, '] ',  num, ' de ', nipe_descricao[nipe], ' - ', tipo_descricao)
end;

procedure carta_redefine_poder_sem_nipe(var carta:tCarta);
begin
  with carta do
  poder := poder - (nipe - 1);
end;

function carta_redefine_poder_sem_nipe_integer(var carta:tCarta):integer;
begin
  with carta do
  begin
    if (tipo = 'N') then
    poder := poder - (nipe - 1);
    carta_redefine_poder_sem_nipe_integer:=poder;
  end
end;
End.