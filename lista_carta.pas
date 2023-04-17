unit lista_carta;
interface
uses carta;
  const listaMaxSize = 5000;

  type
    tListaCarta = record
      arr: array[1..listaMaxSize] of tCarta;
      qtd: integer;
      max: integer;
    end;

  procedure escreverListaCarta(lista: tListaCarta);
  function removerValorDaListaCarta(valor: tCarta; var lista: tListaCarta): integer;
  function removerDaListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;
  procedure inserirNaListaCarta(valor: tCarta;var lista: tListaCarta);
  procedure inicializarListaCarta(var lista: tListaCarta; tamanho: integer);
  function recuperarValorListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;

implementation
  //Procedimentos
  procedure escreverListaCarta(lista: tListaCarta);
    var i: integer;
    begin
      with lista do begin
        for i:= 1 to qtd do begin
          write(' [', i, '] - ');
          carta_escrever(arr[i]);
          write(' ');
        end;
      end;
    end;



  function pegarPosicaoParaInserir(valor: tCarta;lista: tListaCarta):integer;
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
            if (valor.poder <= arr[i].poder) then
              achou:= 1;
            inc(i);
          end;
        end;
        pegarPosicaoParaInserir:= posicaoInserir;
      end;
    end;

  procedure liberarEspacoLista(posicao: integer; var lista: tListaCarta);
    var i: integer;
    begin
      with lista do begin
        for i:= (max) downto (posicao + 1) do begin
          arr[i]:= arr[i-1];
        end;
      end;
    end;

  procedure removerEspacoLista(posicao: integer; var lista: tListaCarta);
    var i: integer;
    begin
      with lista do begin
        for i:= (posicao) to (max -1) do begin
          arr[i]:= arr[i+1];
        end;
      end;
    end;

  function acharPosicaoNaLista(valor: tCarta; var lista: tListaCarta): integer;
    var i, posicao:integer;
    begin
      with lista do begin
        for i:= 1 to qtd do begin
          if (arr[i].poder = valor.poder) then
            posicao:= i;
        end;
        acharPosicaoNaLista:= posicao;
      end;
    end;

  function removerValorDaListaCarta(valor: tCarta; var lista: tListaCarta): integer;
    var posicao:integer;
    begin
      with lista do begin
        posicao:= acharPosicaoNaLista(valor, lista);
        if (posicao = 0) then begin
          writeln('A carta nao existe na lista!');
          removerValorDaListaCarta:= 0
        end else begin
          removerEspacoLista(posicao, lista);
          dec(qtd);
          removerValorDaListaCarta:= 1;
        end;
      end;
    end;

  function removerDaListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;
    begin
      with lista do begin
        if ((posicao < 0) or (posicao > qtd)) then begin
          writeln('O valor na posicao: ', posicao, ' nao existe na lista!');
        end else begin;
          removerDaListaCartaPorPosicao:= arr[posicao];
          removerEspacoLista(posicao, lista);
          dec(qtd);
        end;
      end;
    end;

  function recuperarValorListaCartaPorPosicao(posicao: integer; var lista: tListaCarta): tCarta;
    begin
      with lista do begin
        if ((posicao > 1) and (posicao > qtd)) then begin
          writeln('O valor na posicao: ', posicao, ' nao existe na lista!');
        end else begin;
          recuperarValorListaCartaPorPosicao:= arr[posicao]
        end;
      end;
    end;

  procedure inserirNaListaCarta(valor: tCarta;var lista: tListaCarta);
    var posicaoInserir: integer;
    begin
      with lista do begin
        if (qtd = max) then
          writeln('Lista esta cheia!')
        else if (acharPosicaoNaLista(valor, lista) <> 0) then begin
          writeln('A carta ja existe na lista')
        end else begin
          posicaoInserir:= pegarPosicaoParaInserir(valor, lista);
          liberarEspacoLista(posicaoInserir, lista);
          arr[posicaoInserir]:= valor;
          inc(qtd);
        end;
      end;
    end;
    
  procedure inicializarListaCarta(var lista: tListaCarta; tamanho: integer);
  begin
    with lista do begin
      if (tamanho > 0) then
        max:= tamanho
      else
        max:= listaMaxSize;

      qtd:= 0;
    end;
  end;

end.