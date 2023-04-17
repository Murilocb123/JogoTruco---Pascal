unit util;
interface

function aleatorioEntre(min, max: integer): integer;
function percentPerOption(porcent:integer):integer;

implementation

  function aleatorioEntre(min, max: integer): integer;
  begin
    aleatorioEntre:= random(max-min+1) + min;
  end;

    {Retorna 1 - Esolheu a opção | 0 - Nao escolheu a opção}
  function percentPerOption(porcent:integer):integer;
  var randomValue:integer;
  begin
      if not (porcent=0) then
      begin
          randomValue :=aleatorioEntre(1,100);
          if (randomValue <= porcent) then
              percentPerOption := 1
      end else
          percentPerOption := 0;
  end;

end.