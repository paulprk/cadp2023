program seis;

procedure leer();
var
    num,max:integer;
begin
    max:=-1;
    write('Ingrese un numero:'); readln(num);
    while(num >= 0)do begin
        if((num mod 2)=0)then
            if(num > max)then
                max:=num;
        write('Ingrese un numero:'); readln(num);
    end;    
    writeln('El numero par mas grande fue:',max);
end;

begin
    leer();
end.