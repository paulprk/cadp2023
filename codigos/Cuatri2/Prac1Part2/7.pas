program seven;
var
    name,namemin1,namemin2,namemax1,namemax2:string;
    time,min1,min2,max1,max2:real;
    i:integer;
begin
    min1:=9999; min2:=9999; max1:=0; max2:=0;
    for i:=1 to 4 do begin
        write('Enter a name:'); readln(name);
        write('Enter the time:'); readln(time);
        if(time < min1)then begin
            min2:=min1;
            namemin2:=namemin1;
            min1:=time;
            namemin1:=name;
        end
        else if(time < min2)then begin
            min2:=time;
            namemin2:=name;
        end;
        if(time > max1)then begin
            max2:=max1;
            namemax2:=namemax1;
            max1:=time;
            namemax1:=name;
        end
        else if(time > max2)then begin
            max2:=time;
            namemax2:=name;
        end;
    end;
    writeln('The names of the two drivers who finished in the top two positions: ',namemin1,' and ',namemin2);
    writeln('The names of the two drivers who finished in the last two places: ',namemax1,' and ',namemax2);
end.