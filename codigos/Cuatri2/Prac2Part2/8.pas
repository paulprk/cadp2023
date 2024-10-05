program ocho;
const 
    finish=12345;

procedure Descomponer(num:integer;var paressuma,impares:integer);
begin
    paressuma:=0;   impares:=0;
    while(num <> finish)and (num <> 0)do begin
        if((num mod 2)=0)then
            paressuma+=num mod 10
        else
            impares+=1;
        num:=num div 10;
    end;
    writeln('Suma de sus pares: ',paressuma);
    writeln('Cantidad de impares: ',impares);
end;

var
    num,paressuma,impares:integer;
begin
    write('Ingrese un numero:'); readln(num);
    while(num <> finish)do begin
        Descomponer(num,paressuma,impares);
        write('Ingrese un numero:'); readln(num);
    end;
end.