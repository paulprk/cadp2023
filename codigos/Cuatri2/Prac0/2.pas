program two;
//a. Utilizando una variable adicional
var
    num1,num2,result:integer;
begin
    writeln('Enter 2 numbers: ');
    read(num1); read(num2);
    result:=num1+num2;
    writeln('The result is: ',result);
end.
//b. Sin utilizar una variable adicional
var
    num1,num2:integer;
begin
    writeln('Enter 2 numbers: ');
    read(num1); read(num2);
    writeln('The result is: ',num1+num2);
end.