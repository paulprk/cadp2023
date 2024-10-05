program punteros;
type
    cadena = string[9];
    producto = record
        codigo: integer;                    //2 Bytes
        descripcion: cadena;                //10 Bytes
        precio: real;                       //8 Bytes
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes');           //4 Bytes 
    writeln(sizeof(prod), ' bytes');        //24 Bytes 
    new(p);
    writeln(sizeof(p), ' bytes');           //4 Bytes
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');          //24 Bytes
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');          //24 Bytes
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');        //24 bytes
end.
