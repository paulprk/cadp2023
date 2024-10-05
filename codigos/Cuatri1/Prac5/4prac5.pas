{Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.}

{a)}
program puntero;
type
    cadena=string[50]; //51 bits
    puntero_cadena=^cadena; //4 bits
var
    pc:puntero_cadena; //4 bits
begin
    pc^:='un nuevo texto'; //51 bits
    new(pc); //4 bits
    writeln(pc^)    //imprime error
end.

{b)}
program punteros;
type
    cadena=string[50]; //51 bits
    puntero_cadena:=^cadena; //4 bits
var
    pc:puntero_cadena; //4 bits
begin
    new(pc); //4 bits
    pc^:='un nuevo nombre'; //51 bits
    writeln(sizeof(pc^),' bytes');  //imprime 51
    writeln(pc^);   //imprime "un nuevo nombre"
    dispose(pc); //libera memoria
    pc^:='otro nuevo nombre';
end.

{c)}
program punteros;
type
    cadena=string[50]; //51 bits
    puntero_cadena=^cadena; //4 bits

procedure cambiarTexto(pun:puntero_cadena);
begin
    pun^:='Otro texto';
end;

var
    pc:puntero_cadena; //4 bits
begin
    new(pc); //4 bits
    pc^:='Un texto';
    writeln(pc^); //imprime "Un texto"
    cambiarTexto(pc);
    writeln(pc^); //imprime "Otro texto"
end.

{d)}
program punteros;
type
    cadena = string[50]; //51 bits
    puntero_cadena = ^cadena; //4 bits

procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun); //4 bits
    pun^:= 'Otro texto';
end;

var
    pc: puntero_cadena; //4 bits
begin
    new(pc); //4 bits
    pc^:= 'Un texto';
    writeln(pc^);   //imprime "Un texto"
    cambiarTexto(pc);
    writeln(pc^);   //imprime "Un texto", por el new en el procedure.
end.
