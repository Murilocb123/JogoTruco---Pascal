Program Pzim ;

type
P_pontuacao = record
  usuario: integer;
  maquina: integer;
end;

var pontuacao: P_pontuacao;

//PROCEDIMENTO MOSTRAR PONTUAÇÂO SALVA NO REGISTRO
procedure mostrarPontos(var pontuacao:P_pontuacao);
begin
  with  pontuacao  do begin
  	if usuario >= 12 then
  		begin
  			writeln(' ');
  			writeln('-----------------');
				writeln('USUARIO VENCENDOR');
  			writeln('-----------------');
  		end
		else if maquina >= 12 then
		       begin
					 		writeln(' ');
  						writeln('-----------------');
							writeln('MAQUINA VENCENDOR');
  						writeln('-----------------');		
  				  end;		
    writeln(' ');
    writeln(' USUARIO: ',usuario,' ');
    writeln(' ');
    writeln(' MAQUINA: ',maquina,' ');
    
  end;
end;

//PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" é salvado os pontos multiplicando por 3  
procedure marcarPontos(var pontuacao:P_pontuacao; pontuador: string; valor: integer );
begin
  with  pontuacao  do begin
    
    if pontuador = 'USUARIO' then
    begin
      if valor = 0 then
      	usuario:=usuario+1
      else if valor > 0 then
      				usuario:= usuario + valor * 3;
    end  			
    else if pontuador = 'MAQUINA' then
    begin
      if valor = 0 then
      	 maquina:=maquina+1
      else if valor > 0 then
      				maquina:= maquina + valor * 3;
    end;
    
  end;
end;

function Escura(var pontuacao:P_pontuacao) :boolean;

	begin
	      with pontuacao do begin
	          if (usuario = 11) and (maquina = 11) then
							begin
									Escura:= true;
									writeln(' ');
									writeln('-----------');
									writeln('MÃO DE ONZE');	
									writeln('-----------'); 
				          writeln(' ');
				      end
						else
							begin
									Escura:=false;
							end;	    
				end;
	
	
	end;
	
// comando principal	
Begin
//demonstracao
	marcarPontos(pontuacao,'MAQUINA',3);
  marcarPontos(pontuacao,'USUARIO',3);
	Escura(pontuacao);
	mostrarPontos(pontuacao);
  
End.