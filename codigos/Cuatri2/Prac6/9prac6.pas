program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

procedure ImprimirLista(l:lista);
begin
    writeln('----------------------------');
    while(l <> nil)do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

function EstaOrdenada(l:lista):Boolean;
var
    anterior:lista;
begin
    anterior:=l;
    while(l <> nil)and (anterior^.num <= l^.num)do begin
        anterior:=l;
        l:=l^.sig;
    end;
    EstaOrdenada:=(l=nil);
end;

procedure EliminarLista(var l:lista;num:integer;var ok:boolean);
var
    actual,anterior:lista;
begin
    ok:=False;
    actual:=l;
    anterior:=l;
    while(actual <> nil)and (actual^.num <> num)do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual <> nil)and (actual^.num = num)then begin
        if(actual = l)then
            l:=l^.sig
        else
            anterior^.sig:=actual^.sig;
        ok:=true;
        Dispose(actual);
    end;
end;

procedure SubLista1(l:lista;var l2:lista;a,b:integer);

    procedure ArmarNuevaLista(var l:lista;num:integer);
    var
        actual,nuevo:lista;
    begin
        new(nuevo);
        nuevo^.num:=num;
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

begin
    l2:=nil;
    while(l <> nil)do begin
        if(l^.num > a)and (l^.num < b)then
            ArmarNuevaLista(l2,l^.num);
        l:=l^.sig;
    end;
    ImprimirLista(l2);
end;

{ascendente
begin
    l2:=nil;
    while(l <> nil)and (l^.num < b)do begin
        armarnuevalista(l2,l^.num);
        l:=l^.sig;
    end;
    ImprimirLista(l2);
end;
}

{descendente
begin
    l2:=nil;
    while(l <> nil)and (b < l^.num))do begin
        armarnuevalista(l2,l^.num);
        l:=l^.sig;
    end;
    ImprimirLista(l2);
end;
}

var
    pri,seg : lista;
    valor,a,b : integer;
    ok:Boolean;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    ImprimirLista(pri);
    if(EstaOrdenada(pri))then
        writeln('Esta Ordenada')
    else
        writeln('No esta ordenada');
    writeln('Ingrese un numero a eliminar:'); readln(valor);
    EliminarLista(pri,valor,ok);
    if(ok)then
        writeln('Se elimino')
    else
        writeln('No se elimino o encontro');
    writeln('Ingrese numero A:'); readln(a);
    writeln('Ingrese numero B:'); readln(b);
    SubLista1(pri,seg,a,b);
end.