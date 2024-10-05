program nine;
var
    caracter:char;
    num,subtraction,addition:Integer;
begin
    addition:=0; subtraction:=0;
    write('Enter "-" or "+":'); readln(caracter);
    if(caracter = '-')then begin
        write('Enter a number:'); readln(num);
        while(num <> 0)do begin
            subtraction:=num-subtraction;
            writeln(subtraction);
            write('Enter a number:'); readln(num);
        end;
        writeln(subtraction);
    end
    else if(caracter = '+')then begin
        write('Enter a number:'); readln(num);
        while(num <> 0)do begin
            addition:=addition+num;
            write('Enter a number:'); readln(num);
        end;
        writeln(addition);
    end
    else
        writeln('ERROR');
end.