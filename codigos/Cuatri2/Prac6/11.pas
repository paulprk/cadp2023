program once;
type
    alumnos=record
        num:integer;
        apellido:string[20];
        prom:real;
    end;

    lista=^nodo;
    nodo=record
        dato:alumnos;
        sig:lista;
    end;

procedure CargarLista(var l:lista);
    procedure leerAlumnos(var a:alumnos);
    begin
        writeln('-------------------------');
        write('Ingres el numero de alumno:'); readln(a.num);
        if(a.num <> 0)then begin
            write('Ingrese el apellido:'); readln(a.apellido);
            write('Ingrese el promedio:'); readln(a.prom);  
        end;
    end;
    procedure InsertarOrdenado(var l:lista;a:alumnos);
    var
        actual,anterior,nue:lista;
    begin
        new(nue);
        nue^.dato:=a;
        nue^.sig:=nil;
        actual:=l;
        while(actual <> nil)and (actual^.dato.prom > a.prom)do begin
            anterior:=actual;
            actual:=actual^.sig;
        end;
        if(actual = l)then
            l:=nue
        else
            anterior^.sig:=nue;
        nue^.sig:=actual;
    end;

var
    a:alumnos;
begin
    l:=nil;
    leerAlumnos(a);
    while(a.num <> 0)do begin
        InsertarOrdenado(l,a);
        leerAlumnos(a);
    end;
end;

procedure InformarEgresados(l:lista);
var
    i:integer;
begin
    writeln('-----------------------');
    for i:=1 to 10 do begin
        if(l <> nil)then begin
            writeln('Egreasdo N',i,' con apellido:',l^.dato.apellido,' y numero de alumno:',l^.dato.num);
            l:=l^.sig;
        end;
    end;
end;

procedure ImprimirLista(l:lista);
begin
    writeln(l^.dato.num);
    writeln(l^.dato.apellido);
    writeln(l^.dato.prom:0:2);
end;

var
    l:lista;
begin
    CargarLista(l);
    ImprimirLista(l);
    InformarEgresados(l);
end.