program four;
var
    num,aux:real;
begin
    write('Enter number:'); readln(num);
    write('Enter real numbers:'); readln(aux);
    while((num*2)<>aux)do begin
        write('Enter real numbers:'); readln(aux);
    end;
end.