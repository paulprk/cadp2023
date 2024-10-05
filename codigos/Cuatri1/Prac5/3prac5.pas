{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;
type
    numeros = array[1..10000] of integer; //20000 bits
    puntero_numeros = ^numeros; //4 bits
var
    n: puntero_numeros; //4 bits
    num: numeros; // 20000 bits
    i:integer; //2 bits
begin
    writeln(sizeof(n), ' bytes'); //imprime 4
    writeln(sizeof(num), ' bytes'); //imprime 20000
    new(n); //4 bits
    writeln(sizeof(n^), ' bytes'); //imprime 20000
    for i:= 1 to 5000 do
        n^[i]:= i; //20000
    writeln(sizeof(n^), ' bytes'); //imprime 20000
end.