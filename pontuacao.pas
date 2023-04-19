unit pontuacao;

interface


  type
    tPontuacao = record
    pontos_usuario: integer;
    pontos_maquina: integer;
    pontos_ultimo_vencedor: string;
  end;





    procedure pontuacao_inicializar(pontuacao:tPontuacao); // PROCEDIMENTO zera a pontuacao
    function pontuacao_tem_vencedor(pontuacao:tPontuacao):boolean; // FUNCAO TEM VENCEDOR true ou false
    function pontuacao_vencedor(pontuacao:tPontuacao): string; //FUNCAO VENCEDOR string
    procedure pontuacao_mostrar_pontos(pontuacao:tPontuacao); //PROCEDIMENTO MOSTRAR PONTUACAO SALVA NO REGISTRO
	  procedure pontuacao_marcar_pontos(pontuacao:tPontuacao;pontuador:string;valor:integer); //PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3}
    function pontuacao_ultimo_ganhador(pontuacao:tPontuacao):string; //ULTIMO GANHADOR (chamada no marcarPontos)
    function pontuacao_escura(pontuacao:tPontuacao):boolean; //COMANDO ESCURA (quando ambos tiverem 11 pontos)
    function pontuacao_quanto_falta_pro_perderdor_ganhar(pontuacao: tPontuacao): integer; // Retorna quantos pontos restam pro perdedor ganhar





implementation

	// PROCEDIMENTO zera a pontuacao
procedure pontuacao_inicializar (var pontuacao:tPontuacao);
begin
    with pontuacao do begin
        pontos_usuario:= 0;
        pontos_maquina:= 0;
    end;
end;

// FUNCAO TEM VENCEDOR true ou false
function pontuacao_tem_vencedor(var pontuacao: tPontuacao):boolean;
begin
    with pontuacao do begin
		    if (pontos_usuario >=12) or (pontos_maquina >=12) then
				    pontuacao_tem_vencedor:= true
				else
				    pontuacao_tem_vencedor:= false;
		end;
end;

//FUNCAO VENCEDOR string
function pontuacao_vencedor(var pontuacao: tPontuacao): string;
begin
    with pontuacao do begin
        if pontos_usuario >= 12 then
          begin
				     pontuacao_vencedor:='USUARIO';
				     pontuacao_tem_vencedor(pontuacao);
				  end
		    else if pontos_maquina >= 12 then
		           begin
							    pontuacao_vencedor:='MAQUINA';
									pontuacao_tem_vencedor(pontuacao);
								end
						 else
						    pontuacao_vencedor:='NINGUEM';
						    pontuacao_tem_vencedor(pontuacao);
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
function pontuacao_ultimo_ganhador(var pontuacao:tPontuacao):string;

begin
  with pontuacao do begin
      if (pontos_ultimo_vencedor = 'MAQUINA') or ( pontos_ultimo_vencedor = 'USUARIO')then
        pontuacao_ultimo_ganhador := pontos_ultimo_vencedor
     else
		   pontuacao_ultimo_ganhador := 'NINGUEM';
	 end;
end;

//PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3}
procedure pontuacao_marcar_pontos(var pontuacao:tPontuacao; pontuador: string; valor: integer );
begin
  with  pontuacao  do begin

    if pontuador = 'USUARIO' then
    begin
      pontos_usuario:= pontos_usuario + valor;
    end
    else if pontuador = 'MAQUINA' then
    begin
      pontos_maquina:= pontos_maquina + valor;
    end;
		 pontos_ultimo_vencedor:= pontuador;
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

function pontuacao_quanto_falta_pro_perderdor_ganhar(pontuacao: tPontuacao): integer;
begin
  with pontuacao do begin
    if pontos_usuario > pontos_maquina then
      pontuacao_quanto_falta_pro_perderdor_ganhar := 12 - pontos_maquina
    else
      pontuacao_quanto_falta_pro_perderdor_ganhar := 12 - pontos_usuario;
  end;
end;

end.