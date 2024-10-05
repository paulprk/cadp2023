program sieteb;
//b
procedure Descomponer(num:integer;var cant,suma:integer);
begin
    cant:=0;    suma:=0;
    while(num<>0)do begin
        cant+=1;
        suma+=num mod 10;
        num:=num div 10;
    end;
    writeln('Cantidad de digitos: ',cant,' la suma de ellos es un total de: ',suma);
end;

var
    num,cant,suma:integer;
begin
    write('Ingrese un numero:'); readln(num);
    Descomponer(num,cant,suma);
    while(suma <> 10)do begin
        write('Ingrese un numero:'); readln(num);
        Descomponer(num,cant,suma);
    end;
end.