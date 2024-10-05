program dos;
const
    fin=1122;
type
    str20=string[40];
    rangoPol=1..6;

    cliente=record
        codCliente:integer;
        dni:integer;
        apeyNom:str20;
        cod:rangoPol;
        montoBasico:real;
    end;
    lista=^nodo;
    nodo=record
        dato:cliente;
        sig:lista;
    end;

procedure cargarLista(var l:lista);
    procedure leerCliente(var c:cliente);
    begin
        write('Ingrese el codigo de cliente:'); readln(c.codCliente);
        write('Ingrese el dni:'); readln(c.dni);
        write('Ingrese el apellido y nombre:'); readln(c.apeyNom);
        write('Ingrese el codigo de poliza contratada(1..6):'); readln(c.cod);
        write('Ingrese el monto basico abonado mensualmente:'); readln(c.montoBasico);
    end;
    procedure agregarAtras(var l:lista;c:cliente);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=c;
        nue^.sig:=Nil;
        if(l = nil)then
            l:=nue
        else begin
            act:=l;
            while(act^.sig <> nil)do
                act:=act^.sig;
            act^.sig:=nue;
        end;
    end;

var
    c:cliente;
begin
    repeat
        leerCliente(c);
        AgregarAtras(l,c);
    until(c.codCliente = fin);
end;

procedure recorrerLista(l:lista);
    function pago(montoBasico,montoadicional):real;
    begin
        pago:=(montoBasico+montoadicional);
    end;
    function ok(dni:integer):boolean;
    var
        nueve:integer;
    begin
        while(dni <> 0)do begin
            if(dni mod 9 = 0)then
                nueve:=nueve+1
            dni:=dni div 10;
        end;
        ok:=(nueve <= 2);
    end;

begin
    while(l <> nil)do begin
        writeln('--------------------------------');
        writeln('El cliente: ',l^.dato.codCliente,' con dni: ',l^.dato.dni,' nombre y apellido: ',l^.dato.apeyNom,' y poliza n: ',l^.dato.cod,' el monto completo a pagar es de: ',pago(l^.dato.montoBasico,montoadicional):0:2);
        if(ok(l^.dato.dni))then
            writeln('El cliente con nombre y apellido: ',l^.dato.apeyNom,' contiene al menos 2 digitos 9');
        l:=l^.sig;
    end;
end;

procedure eliminar(var l:lista;cod:integer;var ok:boolean);
var
    ant,act:lista;
begin
    act:=l;
    ok:=false;
    while(act <> nil)and (act^.dato.codCliente <> cod)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)then begin
        ok:=true;
        if(act = l)then
            l:=l^.sig
        else
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

var
    l:lista;
    cod:integer;
    ok:boolean;
begin
    cargarLista(l);
    RecorrerLista(l);
    write('Ingrese codigo de cliente a eliminar:'); readln(cod);
    Eliminar(l,cod,ok);
    if(ok)then
        writeln('Se elimino');
end.