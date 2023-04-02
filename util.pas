unit util;
interface

function aleatorioEntre(min, max: integer): integer;

implementation

  function aleatorioEntre(min, max: integer): integer;
  begin
    aleatorioEntre:= random(max-min+1) + min;
  end;

end.