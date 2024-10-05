{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;
type
    cadena = string[9]; //10 bits
    producto = record //2+4+10=16 bits
        codigo: integer; 
        descripcion: cadena;
        precio: real;
    end;
    puntero_producto = ^producto;//4 bits
var
    p: puntero_producto;//4 bits
    prod: producto;//16 bits
begin
    writeln(sizeof(p), ' bytes');  //imprime 4 
    writeln(sizeof(prod), ' bytes');  //imprime 16
    new(p); //4 bits
    writeln(sizeof(p), ' bytes');  //imprime 4 
    p^.codigo := 1; //16 bits
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');  //imprime 16
    p^.precio := 200; //16 bits 
    writeln(sizeof(p^), ' bytes');  //imprime 16
    prod.codigo := 2; //16 bits
    prod.descripcion := 'otro nuevo producto'; 
    writeln(sizeof(prod), ' bytes');    //imprime 16
end.
