program ejercicio2;
type
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: persona;
        sig: lista;
    end

procedure leerPersona(p: persona); //error 4 tiene que ser por referencia
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); //l por referencia error 5
var
    aux: lista;
begin
    //new(aux) error 6
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; //p:persona; error 2
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
        //leerPersona(p) error 3
    end;
end;

procedure imprimirInformacion(var l:lista); //l por valor error 7
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.nombre, 'Apellido:', l^.apellido);//error 8, l^.dato.nombre y error 9 l^.dato.apellido
        l:= l^.sig;
    end;
end;

{Programa principal}
varZ
    l:lista;
begin
    //l:=nil error 1
    generarLista(l);
    imprimirInformacion(l);
end.


