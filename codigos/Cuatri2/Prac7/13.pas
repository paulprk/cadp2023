program trece;
const
    dF=35;
type
    str40=string[40];
    rango=1..dF;

    libro=record
        titulo:str40;
        nombreEditorial:str40;
        paginas:integer;
        anioEdicion:integer;
        cantVentas:integer;
        areaTematica:rango;
    end;
    lista2=^nodo2;
    nodo2=record
        dato:libro;
        sig:lista2;
    end;

    detalles=record
        nombreTematic:str40;
        paginas250:integer;
    end;
    planeta=record
        nombreEdi:str40;
        anioAntiguo:integer;
        editados:integer;
        totalventas:integer;
        detalle:detalles;
    end;
    lista=^nodo;
    nodo=record
        dato:planeta;
        sig:lista;
    end;

procedure leerYcargar(var l:lista);
var
    libro:libro;
begin
    repeat
        leerLibros(libro);

        if(libro.nombreEditorial = 'Planeta Libros')then
            AgregarAtras(l,libro);
        AgrearAtras(l,libro);
    until(libro.titulo = 'Relato de un naufrago');
end;

var
    l:lista;
begin
    leerYcargar(l);
end.