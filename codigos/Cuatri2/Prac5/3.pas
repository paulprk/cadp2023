program punteros;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes');           //20000 Bytes 10000*2Bytes Integer= 20000 Bytes
    writeln(sizeof(num), ' bytes');         //20000 Bytes
    new(n);
    writeln(sizeof(n^), ' bytes');          //20000 Bytes
    for i:= 1 to 5000 do
    n^[i]:= i;
    writeln(sizeof(n^), ' bytes');          //20000 Bytes
end.