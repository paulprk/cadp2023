program doce;
type
    telefono=record
        version:real;
        pantalla:real;
        ram:integer;
    end;

    lista=^nodo;
    nodo=record
        dato:telefono;
        sig:lista;
    end;

procedure cargarLista(var l:lista); //Se Dispone

procedure RecorrerLista(l:lista);
    function promedio(largo:real;cantidadtelefonos:integer):real;
    begin
        promedio:=largo/cantidadtelefonos;
    end;

var
    VersionActual,prom,largopantalla:real;
    cantMisma,cantRP,cantidadtelefonos:integer;
begin
    cantRP:=0; cantidadtelefonos:=0; largopantalla:=0;
    while(l <> nil)do begin
        cantMisma:=0;
        VersionActual:=l^.dato.version;
        while(l <> nil)and (VersionActual = l^.dato.version)do begin
            cantMisma:=cantMisma+1;
            if(l^.dato.ram > 3)and (l^.dato.pantalla <= 5)then
                cantRP:=cantRP+1;
            cantidadtelefonos:=cantidadtelefonos+1;
            largopantalla:=largopantalla+l^.dato.pantalla;
            prom:=promedio(largopantalla,cantidadtelefonos);
            l:=l^.sig;
        end;
        writeln('Cantidad de dispositivos de la version',VersionActual,' fueron:',cantMisma);
    end;
    writeln('Cantidad de dispositivos con mas de 3GB de ram y pantallas de a lo sumo 5 pulgadas',cantRP);
    writeln('El tamaño promedio de las pantallas es:',prom);
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l); //Se Dispone
    RecorrerLista(l);
end.