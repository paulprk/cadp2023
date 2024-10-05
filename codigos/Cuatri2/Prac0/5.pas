program five;
const
    price=1.60;
var
    candies,clients:integer;
begin
    write('Enter quantity of candies:'); readln(candies);
    write('Enter quantity of clients:'); readln(clients);
    writeln('Each customer is resposible: ',candies div clients,' candies');
    writeln('Remaining candies: ',candies mod clients);
    writeln('Price to charge: ',(candies div clients)*clients*price:0:2);
end.