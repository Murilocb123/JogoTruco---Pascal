Program lista;
uses lista, pilha, util;

var pilha1: tPilha;
    op: integer;
    valor: string;
    valorInt: integer;
begin

  inicializarPilha(pilha1, 5);

  op:=1;
  writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~Pilha~~~~~~~~~~~~~~~~~~~~~~~~') ;
  while (op <> 0) do begin
      writeln('-------------------------------------------------------');
      writeln('| 0 - Sair | 1 - Inserir  2 - Remover | 3 - Escrever | 4 - Pegar posicao | 5 - Pegar ultimo valor');
      writeln('-------------------------------------------------------');
      read(op);
      if (op = 1 ) then begin
        read(valor);
        inserirNaPilha(valor, pilha1);
      end else if (op = 2) then begin
        writeln('Valor removido: ', removerDaPilha(pilha1));
      end else if (op = 3) then begin
        escreverPilha(pilha1);
      end else if (op = 4) then begin
        read(valorInt);
        writeln(recuperarValorPilhaPorPosicao(valorInt, pilha1))
      end else if (op = 5) then begin
        writeln(recuperarValorPilha(pilha1))
      end;
  end;
  writeln('~~~~~~~~~~~~~~~~~~~~~~Adeus Humano~~~~~~~~~~~~~~~~~~~~~') ;


end.