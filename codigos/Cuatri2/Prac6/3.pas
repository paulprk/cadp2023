program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure AgregarAtras(var L: lista; v: integer);
var
    nuevo,actual:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
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

procedure ImprimirLista(l:lista);
begin
    while(l <> nil)do begin
        writeln('Num:',l^.num);
        l:=l^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero'); readln(valor);
    while (valor <> 0)do begin
        AgregarAtras(pri, valor);
        writeln('Ingrese un numero'); readln(valor);
    end;
    ImprimirLista(pri);
end.

{
a.
procedure AgregarAtras(var L: lista; v: integer);
var
    nuevo,actual:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
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

b.
procedure AgregarAtras(var L,ult: lista; v: integer);
var
    nuevo,actual:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(l = nil)then
        l:=nuevo
        ult:=nuevo;
    else begin
        ult^.sig:=nuevo;
        ult:=nuevo;
    end;
end;