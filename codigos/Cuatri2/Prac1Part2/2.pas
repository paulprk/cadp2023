program two;
var
    num,count,max:integer;
begin
    count:=0;   max:=0;
    while(count < 10)do begin
        write('Enter a number:'); readln(num);
            count+=1;
        if(num > max)then
            max:=num;
    end;
    writeln('The max number is:',max);
end.    
//a.
var
    num,count,max,pos:integer;
begin
    count:=0; max:=0; pos:=0;
    while(count < 10)do begin
        write('Enter a number:'); readln(num);
            count+=1;
        if(num > max)then begin
            max:=num;
            pos+=1;
        end;
    end;
    writeln('The max number is: ',max,' in the position: ',pos);
end.    