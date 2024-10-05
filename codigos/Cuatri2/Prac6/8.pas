program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure InsertarOrdenado(var L: lista; v: integer);
var
    actual,anterior,nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    actual:=l;
    anterior:=l;
    while(actual <> nil)and (actual^.num < v)do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual = anterior)then
        l:=nuevo
    else
        anterior^.sig:=nuevo;
    nuevo^.sig:=actual;
end;

procedure ImprimirLista(l:lista);
begin
    while(l <> nil)do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        InsertarOrdenado(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    ImprimirLista(pri);
end.