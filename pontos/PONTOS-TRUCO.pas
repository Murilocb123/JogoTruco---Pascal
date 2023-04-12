Program Pzim ;

type
P_pontuacao = record
  usuario: integer;
  maquina: integer;
end;

var pontuacao: P_pontuacao;

//-----TESTE-----//
const
 jogador_user: string = 'USUARIO';
 jogador_machine: string = 'MAQUINA';
//---------------//
	
//FUNCAO VENCEDOR
function vencedor(var pontuacao: P_pontuacao): string;
begin
    with pontuacao do begin  
        if usuario >= 12 then
				     vencedor:='USUARIO VENCENDOR'
		    else if maquina >= 12 then
							 vencedor:='MAQUINA VENCENDOR';  						      		
    end;							
end;
//PROCEDIMENTO MOSTRAR PONTUACAO SALVA NO REGISTRO
procedure mostrarPontos(var pontuacao:P_pontuacao);
begin
  with  pontuacao  do begin	
    writeln(' ');
    writeln(' USUARIO: ',usuario,' ');
    writeln(' ');
    writeln(' MAQUINA: ',maquina,' ');
  end;
end;

//ULTIMO GANHADOR (chamada no marcarPontos)
function ultimo_ganhador(pontuador:string):string;

 begin
     if (pontuador = 'USUARIO') or (pontuador = 'MAQUINA') then
     	ultimo_ganhador:= pontuador
     else 
		  ultimo_ganhador:='NINGUEM'; 	
 end;

//PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3  
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
		writeln(' ',ultimo_ganhador(pontuador)); 
  end;
end;


//COMANDO ESCURA (quando ambos tiverem 11 pontos)
function Escura(var pontuacao:P_pontuacao) :boolean;

	begin
	      with pontuacao do begin
	          if (usuario = 11) and (maquina = 11) then
							begin
									Escura:= true;
									writeln(' ');
									writeln('-----------');
									writeln('MAO DE ONZE');	
									writeln('-----------'); 
				          writeln(' ');
				      end
						else
							begin
									Escura:=false;
							end;	    
				end;
	
	
	end;
	
//TRUCO (aumenta o valor de pontos da rodada)                                                                                                                
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
										 if valor = 4 then
										    truco:= valor
										 else						             
										   truco:= truco(valor+1);
	   end;							     
 end; 	
	
// comando principal	
Begin
//demonstracao
	marcarPontos(pontuacao,jogador_machine,truco(1));
	writeln(' ');
  marcarPontos(pontuacao,jogador_user,truco(1));
	Escura(pontuacao);
	writeln(' ');
	mostrarPontos(pontuacao);
	writeln(vencedor(pontuacao));
  
End.