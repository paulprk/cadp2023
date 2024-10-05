program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure agregarAtras(var l,ult: lista; v: integer);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(l=nil)then begin
        l:=nuevo;
        ult:=nuevo;
    end
    else begin
        ult^.sig:=nuevo;
        ult:=nuevo;
    end;
end;

procedure imprimirLista(pri:lista);
var
    aux:lista;
begin
    aux:=pri;
    while(aux<>nil)do begin
        writeln(aux^.num);
        aux:=aux^.sig;
    end;
end;

procedure incrementarValor(l:lista;num1:integer);
begin
    while(l<>nil)do begin
        l^.num:=l^.num+num1;
        l:=l^.sig;
    end;
end;

var
    pri,ult : lista;
    valor,num1 : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        agregarAtras(pri,ult,valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
    writeln('Ingrese numero a sumar: '); readln(num1);
    incrementarValor(pri,num1);
        imprimirLista(pri);
end.