Program Pzim ;

type
P_pontuacao = record
  usuario: integer;
  maquina: integer;
end;

var pontuacao: P_pontuacao;

//FUN��O VENCEDOR
function vencedor(var pontuacao: P_pontuacao): string;
begin
    with pontuacao do begin  
        if usuario >= 12 then
				     vencedor:='USUARIO VENCENDOR'
		    else if maquina >= 12 then
							 vencedor:='MAQUINA VENCENDOR';  						      		
    end;							
end;
//PROCEDIMENTO MOSTRAR PONTUA��O SALVA NO REGISTRO
procedure mostrarPontos(var pontuacao:P_pontuacao);
begin
  with  pontuacao  do begin	
    writeln(' ');
    writeln(' USUARIO: ',usuario,' ');
    writeln(' ');
    writeln(' MAQUINA: ',maquina,' ');
  end;
end;

//PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" � salvado os pontos multiplicando por 3  
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
									writeln('M�O DE ONZE');	
									writeln('-----------'); 
				          writeln(' ');
				      end
						else
							begin
									Escura:=false;
							end;	    
				end;
	
	
	end;
	
//TRUCO                                                                                                                 
function truco (valor:integer):integer;

var aux:integer;
 begin
 		
     if (valor > 0) and (valor < 5) then
      begin
     		 write('CORRER = 1 ACEITAR = 2 AUMENTAR = 3 ');
     		 read(aux);
     		 if aux = 1 then
     		   truco:= valor - 1
     		 else if aux = 2 then
				        truco:= valor
				      else if aux = 3 then
										truco:= truco(1)+1;
	   end;							     
 end; 	
	
// comando principal	
Begin
//demonstracao
	marcarPontos(pontuacao,'MAQUINA',truco(1));
  marcarPontos(pontuacao,'USUARIO',truco(1));
	Escura(pontuacao);
	mostrarPontos(pontuacao);
	writeln(vencedor(pontuacao));
  
End.