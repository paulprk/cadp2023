program seven;
const
    finish=32767;
var
    cod:integer;
    price,calculation,newprice:real;
begin
    while(cod<>finish)do begin
        write('Enter code:'); readln(cod);
        write('Enter curret price:'); readln(price);
        write('Enter new price:'); readln(newprice);
        calculation:=(price*0.1)+price;
        if(newprice > calculation)then
            writeln('El aumento de precio del producto ',cod,' es superior el 10%')
        else
            writeln('El aumento de precio del producto ',cod,' no supera al 10%');
    end;
end.