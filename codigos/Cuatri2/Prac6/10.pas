program diez;
type

    clientesEspera = record
        dni:integer;
        num:integer;
    end;

    listaEspera=^nodo;
    nodo = record
        dato:clientesEspera;
        sig:listaEspera;
    end;

//Lista Principal
procedure ArmarLista(var lEspera:listaEspera);
    procedure RecibirCliente(dni,sumador:integer;var lEspera:listaEspera);
    var
        actual,nuevo:listaEspera;
    begin
        new(nuevo);
        nuevo^.dato.dni:=dni;
        nuevo^.dato.num:=sumador;
        nuevo^.sig:=nil;
        if(lEspera = nil)then
            lEspera:=nuevo
        else begin
            actual:=lEspera;
            while(actual^.sig <> nil)do
                actual:=actual^.sig;
            actual^.sig:=nuevo;
        end;
    end;
    procedure imprimirLista(lEspera:listaEspera);
    begin
        while(lEspera <> nil)do begin
            writeln('Cliente con dni:',lEspera^.dato.dni);
            writeln('Numero de espera:',lEspera^.dato.num);
            writeln('----------------------------');
            lEspera:=lEspera^.sig;
        end;
    end;
var
    sumador,dni:integer;
begin
    lEspera:=nil; sumador:=0;
    write('Ingrese un dni:'); readln(dni);
    while(dni <> 0)do begin
        sumador:=sumador+1;
        RecibirCliente(dni,sumador,lEspera);
        write('Ingrese un dni:'); readln(dni);
    end;
    imprimirLista(lEspera);
end;

procedure recorrerLista(lEspera:listaEspera);
    procedure AtenderCliente(var dniAtendido,numAtendido:integer;var lEspera:listaEspera);
    var
        aux:listaEspera;
    begin
        aux:=lEspera;
        dniAtendido:=aux^.dato.dni;
        numAtendido:=aux^.dato.num;
        lEspera:=lEspera^.sig;
        Dispose(aux);
    end;

    procedure imprimirLista(lEspera:listaEspera);
    begin
        writeln('----Lista De Espera---');
        while(lEspera <> nil)do begin
        writeln('Dni:',lEspera^.dato.dni);
        writeln('Num Espera:',lEspera^.dato.num);
        lEspera:=lEspera^.sig;
        end;
    end;

var
    dniAtendido,numAtendido:integer;
begin
    while(lEspera <> nil)do begin
        imprimirLista(lEspera);
        AtenderCliente(dniAtendido,numAtendido,lEspera);
        writeln('----Cliente a ser atendido----');
        writeln('Dni a ser tendido:',dniAtendido);
        writeln('Numero de espera a ser atendido:',numAtendido);
    end;
end;

var
    lEspera:listaEspera;
begin
    ArmarLista(lEspera);
    RecorrerLista(lEspera);
end.