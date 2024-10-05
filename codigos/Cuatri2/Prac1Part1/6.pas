program six;
const
    finish=-1;
var
    dni,TotalStu,maxCount,NotableStu:integer;
    average:real;
begin
    TotalStu:=0; maxCount:=0;  NotableStu:=0;
    writeln('Enter file of the student:'); readln(dni);
    while(dni<>finish)do begin
        writeln('Enter average total'); readln(average);
        TotalStu+=1;
        if(average > 6.5)then
            maxCount+=1;
        if(average > 8.5) and (dni < 2500)then
            NotableStu+=1;
        writeln('Enter file of the student:'); readln(dni);
    end;
    writeln('total stundes: ',TotalStu);
    writeln('Total student with average greater than 6.5: ',maxCount);
    writeln('Notable studends: ',(NotableStu/TotalStu)*100:0:2,'%');
end.