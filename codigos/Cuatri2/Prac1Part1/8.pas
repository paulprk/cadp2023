program eight;
var
    caracter:char;
    vowel,i:integer;
begin
    vowel:=0;
    for i:=1 to 3 do begin
        write('Enter a letter:'); readln(caracter);
        if(caracter = 'a')or (caracter = 'e')or (caracter = 'i')or (caracter = 'o')or (caracter = 'u')then
            vowel+=1;
    end;
    if(vowel = 3)then
        writeln(vowel,' eran vocales.')
    else
        writeln('Almenos 1 caracter no era vocal');
end.