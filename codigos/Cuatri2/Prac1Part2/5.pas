program five;
var
    num:integer;
    max,min,addition:integer;
begin
    max:=-1; min:=9999; addition:=0;
    repeat
        write('Enter a number:'); readln(num);
        if(num > max)then
            max:=num;
        if(num < min)then
            min:=num;
        addition:=addition+num;
    until(num = 100);
    writeln('The max number is: ',max,' and the min number is: ',min,' and the total addition is: ',addition);
end.