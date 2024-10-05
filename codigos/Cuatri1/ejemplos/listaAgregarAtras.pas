program x;
type
    Rjugador=record
        dni:integer;
        nomyApe:string;
        altura:integer;
    end;

    lista=^nodo;
    nodo=record
        dato:Rjugador;
        sig:lista;
    end;

procedure leerR(var j:Rjugador);
begin
    with j do begin
        write('Ingrese dni del jugador: '); readln(dni);
        write('Ingrese nombre y Apellido de jugador: '); readln(nomyApe);
        write('Ingrese la altua del jugador: '); readln(altura);
    end;
end;

procedure agregarAtras(var pri,ult:lista;j:Rjugador);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=j;
    nuevo^.sig:=nil;
    if(pri=nil)then
        pri:=nuevo
    else
        ult^.sig:=nuevo;
    ult:=nuevo;
end;


procedure cargarL(var pri:lista);
var
    j:Rjugador;
    ult:lista; 
begin
    leerR(j);
    while(j.dni<>0)do begin
        agregarAtras(pri,ult,j);
        leerR(j);
    end;
end;

var
    pri:lista;
begin
    pri:=nil;
    cargarL(pri);
end.