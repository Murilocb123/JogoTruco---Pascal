Program Pzim ;

//utilizando o comando chr trocamos o valor inteiro por um char
function SingleParaChar (valor:integer): char;

 begin
 				if (valor > 0) and (valor < 9) then
       			SingleParaChar:= chr(valor)
       	else 
				 SingleParaChar :=  chr(157);
				 		
 end;

//utilizando o comando ord trocamos o char por um valor inteiro 
function CharParaInt (valor:char): integer; 

	begin
	      if (ord(valor) > 0) and (ord(valor) < 9) then
	      		CharParaInt := ord(valor)
	      else
					write(' -');
					CharParaInt:= ord('!')		
	end;
	
 
Begin
     writeln(SingleParaChar(3)); 
     writeln(CharParaInt('a'));
End.