{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio}

program punteros;
type
    cadena = string[50]; //51 bits
    puntero_cadena = ^cadena;  //4 bits
var
    pc: puntero_cadena; //4 bits
begin
    writeln(sizeof(pc), ' bytes'); //imprime 4
    new(pc); //4 bits
    writeln(sizeof(pc), ' bytes');  //imprime 4
    pc^:= 'un nuevo nombre'; //51 bits
    writeln(sizeof(pc), ' bytes');  //imprime 4
    writeln(sizeof(pc^), ' bytes');  //imprime 51
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');  //imprime 51
end.