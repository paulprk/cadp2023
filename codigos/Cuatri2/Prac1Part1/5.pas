program five;
var
    num,aux,count:real;
begin
    count:=0;
    write('Enter number:'); readln(num);
    while((num*2)<>aux) and (count<10)do begin
        write('Enter real numbers:'); readln(aux);
        count+=1;
    end;
    writeln('No se ha ingresado el doble de X')
end.