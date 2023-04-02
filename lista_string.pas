unit lista_string;
interface
  const listaMaxSize = 5000;

  type
    tLista = record
      arr: array[1..listaMaxSize] of string;
      qtd: integer;
      max: integer;
    end;

  procedure mostrarLista(lista: tLista);
  function removerDaLista(valor: string; var lista: tLista): integer;
  function removerDaListaPorPosicao(posicao: integer; var lista: tLista): string;
  procedure inserirNaLista(valor: string;var lista: tLista);
  procedure inicializarLista(var lista: tLista; tamanho: integer);
  function recuperarValorLista(posicao: integer; var lista: tLista): string;

implementation
  //Procedimentos
  procedure mostrarLista(lista: tLista);
    var i: integer;
    begin
      with lista do begin
        writeln();
        writeln('Imprimindo lista...');
        writeln('Quantidade: ', qtd);
        for i:= 1 to qtd do
          writeln('[', i, ']', ' - ', arr[i]);
      end;
    end;

  function pegarPosicaoParaInserir(valor: string;lista: tLista):integer;
    var posicaoInserir, i, achou:integer;
    begin
      with lista do begin
        if (qtd = 0) then
          posicaoInserir:= 1
        else if (qtd = max) then
          //Tamanho maximo
          posicaoInserir:= -1
        else begin
          i:= 1;
          while ((achou = 0) and (i <= (qtd + 1))) do begin
            posicaoInserir:= i;
            if (valor <= arr[i]) then
              achou:= 1;
            inc(i);
          end;
        end;
        pegarPosicaoParaInserir:= posicaoInserir;
      end;
    end;

  procedure liberarEspacoLista(posicao: integer; var lista: tLista);
    var i: integer;
    begin
      with lista do begin
        for i:= (max) downto (posicao + 1) do begin
          arr[i]:= arr[i-1];
        end;
        arr[posicao]:= '';
      end;
    end;

  procedure removerEspacoLista(posicao: integer; var lista: tLista);
    var i: integer;
    begin
      with lista do begin
        for i:= (posicao) to (max -1) do begin
          arr[i]:= arr[i+1];
        end;
        arr[max]:= '';
      end;
    end;

  function acharPosicaoNaLista(valor: string; var lista: tLista): integer;
    var i, posicao:integer;
    begin
      with lista do begin
        for i:= 1 to qtd do begin
          if (arr[i] = valor) then
            posicao:= i;
        end;
        acharPosicaoNaLista:= posicao;
      end;
    end;

  function removerDaLista(valor: string; var lista: tLista): integer;
    var posicao:integer;
    begin
      with lista do begin
        posicao:= acharPosicaoNaLista(valor, lista);
        if (posicao = 0) then begin
          writeln('O valor ', valor, ' nao existe na lista!');
          removerDaLista:= 0
        end else begin
          removerEspacoLista(posicao, lista);
          dec(qtd);
          removerDaLista:= 1;
        end;
      end;
    end;
  function removerDaListaPorPosicao(posicao: integer; var lista: tLista): string;
    begin
      with lista do begin
        if ((posicao < 0) or (posicao > qtd)) then begin
          writeln('O valor na posicao: ', posicao, ' nao existe na lista!');
          removerDaListaPorPosicao:= ''
        end else begin;
          removerDaListaPorPosicao:= arr[posicao];
          removerEspacoLista(posicao, lista);
          dec(qtd);
        end;
      end;
    end;
  function recuperarValorLista(posicao: integer; var lista: tLista): string;
    begin
      with lista do begin
        if ((posicao > 1) and (posicao > qtd)) then begin
          writeln('O valor na posicao: ', posicao, ' nao existe na lista!');
          recuperarValorLista:= ''
        end else begin;
          recuperarValorLista:= arr[posicao]
        end;
      end;
    end;
  procedure inserirNaLista(valor: string;var lista: tLista);
    var posicaoInserir: integer;
    begin
      with lista do begin
        if (qtd = max) then
          writeln('Lista esta cheia!')
        else if (acharPosicaoNaLista(valor, lista) <> 0) then begin
          writeln('O valor ', valor, ' ja existe na lista')
        end else begin
          posicaoInserir:= pegarPosicaoParaInserir(valor, lista);
          liberarEspacoLista(posicaoInserir, lista);
          arr[posicaoInserir]:= valor;
          inc(qtd);
        end;
      end;
    end;
  procedure inicializarLista(var lista: tLista; tamanho: integer);
  begin
    with lista do begin
      if (tamanho > 0) then
        max:= tamanho
      else
        max:= listaMaxSize;

      qtd:= 0;
      arr[1]:= '';
    end;
  end;

end.