program six;
type
    range=1..200;
var
    cod,codmin1,codmin2:range;
    price,min1,min2:real;
    count,i:integer;
begin
    min1:=9999; min2:=9999; count:=0;
    for i:=1 to 3 do begin
        write('Enter code:'); readln(cod);
        write('Enter the price:'); readln(price);
        if(price < min1)then begin
            min2:=min1;
            codmin2:=codmin1;
            min1:=price;
            codmin1:=cod;
        end
        else if(price < min2)then begin
            min2:=price;
            codmin2:=cod;
        end;
        if(price > 16)then
            if((cod mod 2)=0)then 
                count+=1;
    end;
    writeln('The two more chep products are: ',codmin1,' and ',codmin2);
    writeln('The quantity of products of more than 16 pesos with even code: ',count);
end.