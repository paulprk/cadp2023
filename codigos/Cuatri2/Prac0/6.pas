program six;
const
    ars=189.32;
var
    dollars,res:real;
begin
    write('Enter quantity of dollars: '); readln(dollars);
    res:=dollars+0.4;
    writeln('The transaction will be: ',res*ars:0:2);
end.