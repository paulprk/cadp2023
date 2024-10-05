program one;
var
    num,count:integer;
    addition:integer;
begin
    count:=0;   addition:=0;
    while(count < 10)do begin
        write('Enter a number:'); readln(num);
        addition+=num;
        count+=1;
    end;
    writeln('Total numbers:',addition);
end.
//a.
var
    num,count,addition:integer;
    greater:integer;
begin
    count:=0;   addition:=0;    greater:=0;
    while(count < 10)do begin
        write('Enter a number:'); readln(num);
        addition+=num;
        count+=1;
        if(num > 5)then
            greater+=1;
    end;
    writeln('Total numbers', addition);
    writeln('Numeros mayores a 5: ',greater);
end.