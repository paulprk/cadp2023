program four;
var
    num,min1,min2,i:integer;
begin
    min1:=9999; min2:=9999;
    for i:=1 to 1900 do begin
        write('Enter a number:'); readln(num);
        if(num < min1)then begin
            min2:=min1;
            min1:=num;
        end
        else if(num < min2)then
            min2:=num;
    end;
    writeln('The two minimus number are: ',min1,' and ',min2);
end.
//a.
var
    num,min1,min2,i:integer;
begin
    min1:=9999; min2:=9999;
    repeat
        write('Enter a number:'); readln(num);
        if(num < min1)then begin
            min2:=min1;
            min1:=num;
        end
        else if(num < min2)then
            min2:=num;
    until(num = 0);
    writeln('The two minimus number are: ',min1,' and ',min2);
end.
//b.
var
    num,min1,min2,i:integer;
begin
    min1:=9999; min2:=9999;
    write('Enter a number:'); readln(num);
    while(num <> 0)do begin
        if(num < min1)then begin
            min2:=min1;
            min1:=num;
        end
        else if(num < min2)then
            min2:=num;
        write('Enter a number:'); readln(num);
    end;
    writeln('The two minimus number are: ',min1,' and ',min2);
end.