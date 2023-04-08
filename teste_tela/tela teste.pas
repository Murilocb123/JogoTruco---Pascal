Program Pzim ;
Uses
Crt, 
UnitElementosVisuais, {Possui fun��es para desenhar os ret�ngulos, contornos, "janelas", "bot�es" entre outros} 
UnitPaintZim; {Possui a fun��o de carregar e desenhar o conte�do de um arquivo .paintzim}


Const
CARTA_0 = 0; CARTA_1 = 1; CARTA_2 = 2; CARTA_3 = 3; CARTA_4 = 4;
CARTA_5 = 5; CARTA_6 = 6; CARTA_7 = 7; CARTA_8 = 8; CARTA_9 = 9;
CARTA_COMPRA_2 = 10;
CARTA_INVERTE = 11;
CARTA_PULA = 12;
CARTA_COMPRA_4 = 13;
CARTA_CORINGA = 14;
COR_VERMELHA = RED;
COR_AZUL = BLUE;
COR_VERDE = GREEN;
COR_AMARELA = YELLOW;
COR_CORINGA = BLACK;
QUANT_CARTAS_MAO = 7;
COR_FUNDO = 3;
VALOR_NULL = 999;
//PONTOS_VITORIA = 500;

DIRETORIO_DADOS = '.\DADOS';

//CONSTANTES DE TECLAS
TECLA_UP = '072';
TECLA_DOWN = '080';
TECLA_RIGHT = '077';
TECLA_LEFT = '075';
TECLA_ENTER = '13';
TECLA_ESC = '27';
TECLA_BACKSPACE = '8';
TECLA_TAB = '9';
TECLA_NULA = '\NULA';
ID_NULL = '\NULL';

Function ArquivosDisponiveis : boolean;

{TestaArquivo : Verifica se o arquivo � acessivel}
Function ArquivoAcessivel (caminho : string) : boolean;
Var
arquivo : text;
Begin
  
  assign(arquivo, caminho);
  {$I-} reset(arquivo); {$I+}
  if IOResult = 0 then
  begin
    close(arquivo);
    ArquivoAcessivel := true;
  end else
  begin
    ArquivoAcessivel := false;
  end;
  
End;

Begin
  ArquivosDisponiveis := false;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_0.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_1.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_2.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_3.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_4.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_5.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_6.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_7.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_8.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_9.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NUMERO_+2.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\CORINGA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\CORINGA_+4.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\INVERTE.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\PULA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\COR_VERMELHA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\COR_AZUL.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\COR_AMARELA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\COR_VERDE.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\COR_CORINGA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\VAZIO.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\FACE_MONTE.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\CARTA_NULA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\CAIXA.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\LOGO.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\PASSARO.paintzim'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\MANUAL'))) then
  Exit;
  if not(ArquivoAcessivel(concat(DIRETORIO_DADOS, '\NOMES'))) then
  Exit;
  ArquivosDisponiveis := true;
End;

Begin
  textbackground(2); clrscr;
  if not  (ArquivosDisponiveis) then
  begin
      DesenhaPainel(20,4,40,17,':(', true, false);
      textcolor(lightred); textbackground(7);
      gotoxy(30,6); write('ISSO ', #144, ' UM PROBLEMA!');
      gotoxy(23,8); write('O Truco n', #198, 'o p', #147, 'de ser iniciado porque');
      gotoxy(22,9); write('algum arquivo externo essencial est', #160);
      gotoxy(36,10); write('faltando.');

      gotoxy(25,13); write('Verifique se a pasta DADOS est', #160);
      gotoxy(22,14); write('no mesmo diret', #162, 'rio deste execut', #160, 'vel.');

      gotoxy(27,17); write('No Pascalzim ',#130,' necess',#160,'rio');
      gotoxy(30,18); write('gerar o execut',#160,'vel.');

      Exit;
	end
	else
	{DesenhaPainel(PosicaoX, Posicaoy, Witdh, height, sombra, borda interna)}
	DesenhaPainel(20,4,40,17,'Informa��es', false, true);
	// DesenhaRentangulo(PosicaoX, Posicaoy, Witdh, height)
//	DesenhaRetangulo('a', 10,10,21,16,5);
//	DesenhaRetangulo('a', 40,10,21,16,5);
//	DesenhaRetangulo('a', 80,10,21,16,5);
	
  
  
End.