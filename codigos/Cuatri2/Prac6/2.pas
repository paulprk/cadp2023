program ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    nodo = record
        dato: persona;
        sig: lista;   
    end;

procedure leerPersona(p: persona);      //falta pasarlo por referencia error 1
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona);       //referencia lista (var L : lista), error 2
var
    aux: lista;
begin                                               //falta new(aux) error 3
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo;         //deberia ser p : persona, error 4
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);       //falta volver a leerPesona(p), error 5
    end;
end;

procedure imprimirInformacion(var l:lista);         //no hace falta pasarlo por referencia error 6
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.nombre, 'Apellido:', l^.apellido); //Falta l^.dato.nombre y l^.dato.apellido, error 7 y 8
        l:= l^.sig;
    end;
end;

{Programa principal}
var
    l:lista;
begin                   //falta l:=nil error 9
    generarLista(l);
    imprimirInformacion(l);
end.
