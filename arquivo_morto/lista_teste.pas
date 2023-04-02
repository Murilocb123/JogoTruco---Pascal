Program lista;
uses lista_string, util;

var lista1: tLista;
    op: integer;
    valor: string;
    valorInt: integer;

begin

  inicializarLista(lista1, 100);

  op:=1;
  writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~Lista~~~~~~~~~~~~~~~~~~~~~~~~') ;
  while (op <> 0) do begin
      writeln('-------------------------------------------------------');
      writeln('| 0 - Sair | 1 - Inserir | 2 - Remover na posicao | 3 - Remover | 4 - Escrever | 5 - Recuperar valor |');
      writeln('-------------------------------------------------------');
      read(op);
      if (op = 1 ) then begin
        read(valor);
        inserirNaLista(valor, lista1);
      end else if (op = 2) then begin
        read(valorInt);
        writeln('Valor removido: ', removerDaListaPorPosicao(valorInt, lista1));
      end else if (op = 3) then begin
        read(valor);
        writeln('Valor removido: ', removerDaLista(valor, lista1));
      end else if (op = 4) then begin
        mostrarLista(lista1);
      end else if (op = 5) then begin
        read(valorInt);
        writeln('Valor na posicao ', valorInt, ' = ', recuperarValorLista(valorInt, lista1));
      end;
  end;
  writeln('~~~~~~~~~~~~~~~~~~~~~~Adeus Humano~~~~~~~~~~~~~~~~~~~~~') ;


end.