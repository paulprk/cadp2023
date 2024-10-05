program one;
var
    num1,num2:integer;
begin
    write('Enter number:'); readln(num1);
    write('Enter number:'); readln(num2);
    if(num1>num2)then
        writeln('The first number is the largest: ',num1)
    else if(num2>num1)then
        writeln('The fist number is the largest: ',num2)
    else
        writeln('Numbers are equal');
end.