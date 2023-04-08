unit pilha_carta;

interface
uses carta;
  const pilhaMaxSize = 5000;

  type
    tPilhaCarta = record
      arr: array[1..pilhaMaxSize] of tCarta;
      qtd: integer;
      max: integer;
    end;

  procedure escreverPilhaCarta(pilha: tPilhaCarta);
  function removerDaPilhaCarta(var pilha: tPilhaCarta): tCarta;
  function recuperarValorPilhaCarta(var pilha: tPilhaCarta): tCarta;
  function recuperarValorPilhaCartaPorPosicao(posicao: integer; var pilha: tPilhaCarta): tCarta;
  function inserirNaPilhaCarta(valor: tCarta;var pilha: tPilhaCarta):integer;
  procedure inicializarPilhaCarta(var pilha: tPilhaCarta; tamanho: integer);

implementation
  //Procedimentos
  procedure escreverPilhaCarta(pilha: tPilhaCarta);
    var i: integer;
    begin
      with pilha do begin
        writeln();
        writeln('Imprimindo pilha...');
        writeln('Quantidade: ', qtd);
        for i:= 1 to qtd do begin
          write('Posicao: ', i, ' - ');
          carta_escrever(arr[i])
        end;
      end;
    end;

  function removerDaPilhaCarta(var pilha: tPilhaCarta): tCarta;
    begin
      with pilha do begin
        if (qtd = 0) then begin
          writeln('A pilha esta vazia');
        end else begin
          removerDaPilhaCarta:= arr[qtd];
          dec(qtd);
        end;
      end;
    end;
  function recuperarValorPilhaCarta(var pilha: tPilhaCarta): tCarta;
    begin
      with pilha do begin
        if (qtd > 0) then begin
          recuperarValorPilhaCarta:= arr[qtd];
        end else begin
          writeln('A pilha esta vazia')
        end;
      end;
    end;
  function recuperarValorPilhaCartaPorPosicao(posicao: integer; var pilha: tPilhaCarta): tCarta;
    begin
      with pilha do begin
        if ((posicao > 0) and (posicao <= qtd)) then begin
          recuperarValorPilhaCartaPorPosicao:= arr[posicao];
        end else begin
          writeln('Esta posicao nao existe na pilha')
        end;
      end;
    end;

  function inserirNaPilhaCarta(valor: tCarta;var pilha: tPilhaCarta):integer;
    begin
      with pilha do begin
        if (qtd = max) then begin
          writeln('Pilha esta cheia!');
          inserirNaPilhaCarta:= 0;
        end else begin
          inc(qtd);
          arr[qtd]:= valor;
          inserirNaPilhaCarta:= 1;
        end;
      end;
    end;
  procedure inicializarPilhaCarta(var pilha: tPilhaCarta; tamanho: integer);
    begin
      with pilha do begin
        if (tamanho > 0) then
          max:= tamanho
        else
          max:= pilhaMaxSize;

        qtd:= 0;
      end;
    end;

end.