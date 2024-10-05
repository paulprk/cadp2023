program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
    nreal:real;
    nenter:integer;
begin
    writeln(sizeof(pc), ' bytes');    //4 Bytes por que es lo que ocupa un puntero
    new(pc);
    writeln(sizeof(pc), ' bytes');    //4 Bytes por que es lo que ocupa un puntero
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');   //4 Bytes  por que es lo que ocupad un puntero
    writeln(sizeof(pc^), ' bytes');  //51 Bytes porque ahora hace pc^ que es a lo que apunta el puntero que apunta a cadena que eson 50 Bytes + 1 donde se guarda la cantidad de caracteres = 51 Bytes
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');  //51 Bytes porque ahora hace pc^ que es a lo que apunta el puntero que apunta a cadena que eson 50 Bytes + 1 donde se guarda la cantidad de caracteres = 51 Bytes
end.