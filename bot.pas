unit bot;
    
interface
    
uses
    crt,views,baralho,carta,pilha_carta,lista_carta,rodada,pontuacao,util;
    {Retorna a opção escolhida}
    function bot_escolhe_acao(ultimaCarta:tCarta; pontuacaoPartida:tPontuacao; cartasLista:tListaCarta; pesoTruco:integer):integer;
    procedure bot_joga_carta(var listaCarta:tListaCarta; cartaPosi:integer; var carta:tCarta);
    function getMediaPoderCartas(listaCarta:tListaCarta):integer;
    function getCarta(listaCarta:tListaCarta; ultimaCarta:tCarta):integer;
    function comparaCartas(listaCarta:tListaCarta; ultimaCarta:tCarta): integer;

implementation
    {acoes=  [1] - carta 1, [2] - carta 2 [3] - carta 3, [4] - trucar, [5]- Correr [6]- Aceitar [7]- Aumentar 3}
    function bot_escolhe_acao(ultimaCarta:tCarta; pontuacaoPartida:tPontuacao; cartasLista:tListaCarta; pesoTruco:integer):integer;
    var mediaPoder:integer;
    begin 
        mediaPoder := getMediaPoderCartas(cartasLista);
        // Caso o peso do truco for zero significa que so pode escolher entre as op 1 a 4
        if (pesoTruco = 0) then 
        begin
            //Verifica se pede truco
            if  ((percentPerOption(0) = 1)) then  
                bot_escolhe_acao := 4
            else 
                bot_escolhe_acao := getCarta(cartasLista, ultimaCarta);
        end
        else
          bot_escolhe_acao := 5;
    end; 
    
    
    {Passado a lista de carta para ser removida a carta, e a carta removida e a lista nova são retornadas}
    procedure bot_joga_carta(var listaCarta:tListaCarta; cartaPosi:integer; var carta:tCarta);
    begin
        carta := removerDaListaCartaPorPosicao(cartaPosi,listaCarta);
    end;


    function getMediaPoderCartas(listaCarta:tListaCarta):integer;
    var soma, i:integer;
    begin
        with listaCarta do begin
            for i := 1 to qtd do
                soma:= soma+arr[i].poder;
            getMediaPoderCartas := soma div qtd;
        end;
    end;
    
    {retorna a posição}
    function getCarta(listaCarta:tListaCarta; ultimaCarta:tCarta):integer;
    var i:integer;
    begin
        if (ultimaCarta.poder = 0) then
          getCarta := aleatorioEntre(1, listaCarta.qtd) 
        else 
          getCarta := comparaCartas(listaCarta, ultimaCarta);
    end;

    function comparaCartas(listaCarta:tListaCarta; ultimaCarta:tCarta): integer;
    var i, posi, ultPoder, poder:integer;
    begin
        posi :=1; //Caso nao tenha uma carta que ganhe, ele jogue a mais fraca;
        if (ultimaCarta.tipo = 'N') then     // Remove o nipe do poder para considerar igual todos os numeros
            ultPoder := carta_redefine_poder_sem_nipe_integer(ultimaCarta)
        else 
            ultPoder := ultimaCarta.poder;
        with listaCarta do begin
            for i := 1 to qtd do
            begin
                if (arr[i].tipo = 'N') then   
                    poder := carta_redefine_poder_sem_nipe_integer(arr[i])
                else
                    poder := arr[i].poder;
                if (poder >ultPoder) then
                begin
                    posi:=i;
                    break;
                end
                else if (poder = ultPoder) then
                    posi:=i;
            end;
            comparaCartas:=posi;
        end;
    end;
    

end.