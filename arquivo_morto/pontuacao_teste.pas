program pontuacao_teste;

 uses pontuacao;

  
 var pontuacao: tPontuacao;
   
   
 begin
    pontuacao_inicializar(pontuacao); // PROCEDIMENTO zera a pontuacao
    pontuacao_tem_vencedor(pontuacao); // FUNCAO TEM VENCEDOR true ou false
		pontuacao_vencedor(pontuacao); //FUNCAO VENCEDOR string 
    pontuacao_mostrar_pontos(pontuacao); //PROCEDIMENTO MOSTRAR PONTUACAO SALVA NO REGISTRO		
		pontuacao_marcar_pontos(pontuacao,'MAQUINA',1); //PROCEDIMENTO MARCADOR DE PONTOS {atravez da variavel "valor" salva os pontos multiplicando por 3}
//    pontuacao_ultimo_ganhador(pontuador); ULTIMO GANHADOR (chamada no marcarPontos)
    pontuacao_escura(pontuacao); //COMANDO ESCURA (quando ambos tiverem 11 pontos)
    

	   
 end.   