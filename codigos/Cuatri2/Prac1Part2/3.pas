program three;
type
    grades=1..10;
var
    name:string;
    grade:grades;
    approved,seven:integer;
begin
    approved:=0; seven:=0;
    while(name <> 'Zidane Zinedine')do begin
        write('Enter a name:'); readln(name);
        write('Enter EPA grade:');  readln(grade);
        if(grade >= 8)then
            approved+=1;
        if(grade = 7)then
            seven+=1;
    end;
    writeln('The students quantity approved: ',approved);
    writeln('the students quantity that they got seven ',seven);
end.