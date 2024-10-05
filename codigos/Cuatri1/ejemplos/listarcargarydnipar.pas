program x;
type
    Rjugadores=record
        dni:integer;
        nomyape:string;
        altura:integer;
    end;

    lista=^nodo;
    nodo=record
        elemento:Rjugadores;
        siguiente:lista;
    end;

procedure leerR(var r:Rjugadores);
begin
    with r do begin
        write('Ingrese el dni del jugador: '); readln(dni);
        write('Ingrese el nombre del jugador y apellido:  '); readln(nomyape);
        write('Ingrese la altura del jugador: '); readln(altura);
    end;
end;

procedure agregarAdelante(var pri:lista;j:Rjugadores);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.elemento:=j;
    nuevo^.siguiente:=pri;
    pri:=nuevo;
end;

function esPar(dni:integer):boolean;
begin
    esPar:=(dni mod 2)=0
end;


function cantdniPar(pri:lista):integer;
var
    cant:integer;
begin
    cant:=0;
    while(pri<>nil)do begin
        if(esPar(pri^.elemento.dni))then
            cant+=1;
        pri:=pri^.siguiente;
    end;
    cantdniPar:=cant;
end;


procedure cargarL(var pri:lista);
var
    j:Rjugadores;
begin
    leerR(j);
    while(j.dni<>0)do begin
        agregarAdelante(pri,j);
        leerR(j);
    end;
end;

var
    primero:lista;
begin
    primero:=Nil;
    cargarL(primero);
    writeln('La cantiad de jugadores con dni par son: ',cantdniPar(primero));
end.