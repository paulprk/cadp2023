program catorce;
const
    fin=-1;
type
    rangoDia=1..31;
    prestamo=record
        nro:integer;
        ISBN:integer;
        nrosocio:integer;
        dia:rangoDia;
    end;
    lista=^nodo;
    nodo=record
        dato:prestamo;
        sig:lista;
    end;

    ISBNlibro=record
        ISBNnro:integer;
        prestado:integer;
    end;
    lista2=^nodo2;
    nodo2=record
        dato2:ISBNlibro;
        sig2:lista2;
    end;

procedure cargarL(var l:lista);
    procedure leerPrestamo(var p:prestamo);
    begin
        writeln('-----------------------------------');
        write('Ingrese ISBM del libro prestado:'); readln(p.ISBN);
        if(p.ISBN <> fin)then begin
            write('Ingrese el nro de prestamo:'); readln(p.nro);
            write('Ingrese el nro de socio:'); readln(p.nrosocio);
            write('Ingrese el dia del prestamo:'); readln(p.dia);
        end;
    end;
    procedure InsertarOrdenado(var l:lista;p:prestamo);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=p;
        act:=l;
        while(act <> nil)and (act^.dato.ISBN < p.ISBN)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l)then
            l:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;
var
    p:prestamo;
begin
    l:=nil;
    leerPrestamo(p);
    while(p.ISBN <> fin)do begin
        InsertarOrdenado(l,p);
        leerPrestamo(p);
    end;
end;

procedure GenerarL2(l:lista;var l2:lista2);
    procedure InsertarOrdenado2(var l2:lista2;ISBNact,cant:integer);
    var
        nue,act,ant:lista2;
    begin
        new(nue);
        nue^.dato2.ISBNnro:=ISBNact;
        nue^.dato2.prestado:=cant;
        act:=l2;
        while(act <> nil)and (act^.dato2.ISBNnro < ISBNact)do begin
            ant:=act;
            act:=act^.sig2;
        end;
        if(act = l2)then
            l2:=nue
        else
            ant^.sig2:=nue;
        nue^.sig2:=act;
    end;
var
    ISBNact,cant:integer;
begin
    l2:=nil;
    while(l <> nil)do begin
        ISBNact:=l^.dato.ISBN;
        cant:=0;
        while(l <> nil)and (ISBNact = l^.dato.ISBN)do begin
            cant:=cant+1;
            l:=l^.sig;
        end;
        InsertarOrdenado2(l2,ISBNact,cant);
    end;
end;

procedure RecorrerL(l:lista);
type
    vcont=array[rangoDia]of integer;
    procedure iniV(var vc:vcont);
    var
        i:rangoDia;
    begin
        for i:=1 to 31 do
            vc[i]:=0;
    end;

    procedure calcMin(vc:vcont);
    var
        i:rangoDia;
        min,minDia:integer;
    begin
        min:=9999;
        for i:=1 to 31 do begin
            if(vc[i] < min)then begin
                min:=vc[i];
                minDia:=i;
            end;
        end;
        writeln('El dia que menos prestamos se realizaron fue el dia:',minDia);
    end;
    function pares(nrosocio:integer):Boolean;
    begin
        if(nrosocio mod 2 = 0)then
            pares:=true
        else
            pares:=false;
    end;

var
    vc:vcont;
    par,impar,prestamosTotal:integer;
begin
    iniV(vc); par:=0; impar:=0; prestamosTotal:=0;
    while(l <> nil)do begin
        vc[l^.dato.dia]:=vc[l^.dato.dia]+1;
        if(pares(l^.dato.nro))then
            par:=par+1
        else
            impar:=impar+1;
        prestamosTotal:=prestamosTotal+1;
        l:=l^.sig;
    end;
    calcMin(vc);
    writeln('Porcentaje de prestamos que poseen nro par fue un total de:',(par/prestamosTotal)*100:0:2);
    writeln('Porcentaje de prestamos que poseen nro impar fue un total de:',(impar/prestamosTotal)*100:0:2)
end;

var
    l:lista;
    l2:lista2;
begin
    cargarL(l);
    GenerarL2(l,l2);
    RecorrerL(l);
end.