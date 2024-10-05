program catorce;
const
    fin=-1;
type
    rangoTrans=1..5;
    viajes=record
        codAlum:integer;
        dia:integer;
        facultad:string[20];
        transporte:rangoTrans;
    end;
    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end;

procedure cargarLista(var l:lista);
    procedure leerViajes(var v:viajes);
    begin
        writeln('----------------------------------');
        write('Ingrese el codigo de alumno(1..1300):'); readln(v.codAlum);
        if(v.codAlum <> fin)then begin  
            write('Ingrese el dia del mes:'); readln(v.dia);
            write('Ingrese la facultad:'); readln(v.facultad);
            write('Ingrese el transporte(1..5):'); readln(v.transporte);
        end;
    end;
    procedure AgregarAtras(var l:lista;v:viajes);
    var
        nuevo,actual:lista;
    begin
        new(nuevo);
        nuevo^.dato:=v;
        nuevo^.sig:=nil;
        if(l = nil)then
            l:=nuevo
        else begin
            actual:=l;
            while(actual^.sig <> nil)do 
                actual:=actual^.sig;
            actual^.sig:=nuevo;
        end;
    end;

var
    v:viajes;
begin
    l:=nil;
    leerViajes(v);
    while(v.codAlum <> fin)do begin
        AgregarAtras(l,v);
        leerViajes(v);
    end;
end;

var
    l:lista;
begin
    cargarLista(l);

end.