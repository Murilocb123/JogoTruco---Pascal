Program Pzim ;

type
tPontuacao = record
  pontos_usuario: integer;
  pontos_maquina: integer;
end;

var pontuacao: tPontuacao;

//-----TESTE-----//
const
 jogador_usuario: string = 'USUARIO';
 jogador_maquina: string = 'MAQUINA';
//---------------//
	
//FUNCAO VENCEDOR
function pontuacao_vencedor(var pontuacao: tPontuacao): string;
begin
    with pontuacao do begin  
        if pontos_usuario >= 12 then
				     pontuacao_vencedor:='USUARIO VENCENDOR'
		    else if pontos_maquina >= 12 then
							 pontuacao_vencedor:='MAQUINA VENCENDOR';  						      		
    end;							
end;
//PROCEDIMENTO MOSTRAR PONTUACAO SALVA NO REGISTRO
procedure pontuacao_mostrar_pontos(var pontuacao:tPontuacao);
begin
  with  pontuacao  do begin	
    writeln(' ');
    writeln(' USUARIO: ',pontos_usuario,' ');
    writeln(' ');
    writeln(' MAQUINA: ',pontos_maquina,' ');
  end;
end;

//ULTIMO GANHADOR (chamada no marcarPontos)
function pontuacao_ultimo_ganhador(pontuador:string):string;

 begin
     if (pontuador = 'USUARIO') or (pontuador = 'MAQUINA') then
     	pontuacao_ultimo_ganhador:= pontuador
     else 
		  pontuacao_ultimo_ganhador:='NINGUEM'; 	
 end;

//PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3}  
procedure pontuacao_marcar_pontos(var pontuacao:tPontuacao; pontuador: string; valor: integer );
begin
  with  pontuacao  do begin
    
    if pontuador = 'USUARIO' then
    begin
      if valor = 0 then
      	pontos_usuario:=pontos_usuario+1
      else if valor > 0 then
      				pontos_usuario:= pontos_usuario + valor * 3;
    end  			
    else if pontuador = 'MAQUINA' then
    begin
      if valor = 0 then
      	 pontos_maquina:=pontos_maquina+1
      else if valor > 0 then
      				pontos_maquina:= pontos_maquina + valor * 3;
    end;
		writeln(' ',pontuacao_ultimo_ganhador(pontuador)); 
  end;
end;


//COMANDO ESCURA (quando ambos tiverem 11 pontos)
function pontuacao_escura(var pontuacao:tPontuacao) :boolean;

	begin
	      with pontuacao do begin
	          if (pontos_usuario = 11) and (pontos_maquina = 11) then
							begin
									writeln(' ');
									writeln('-----------');
									writeln('MAO DE ONZE');	
									writeln('-----------'); 
				          writeln(' ');
				          pontuacao_escura:= true;
				      end
						else
							begin
									pontuacao_escura:=false;
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
	pontuacao_marcar_pontos(pontuacao,jogador_maquina,truco(1));
	writeln(' ');
  pontuacao_marcar_pontos(pontuacao,jogador_usuario,truco(1));
	pontuacao_escura(pontuacao);
	writeln(' ');
	pontuacao_mostrar_pontos(pontuacao);
	writeln(pontuacao_vencedor(pontuacao));
  
End.