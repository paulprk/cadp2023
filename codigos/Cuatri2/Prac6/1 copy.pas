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

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) then begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
. . . { imprimir lista }
end.

{a. Indicar qué hace el programa.
Lee numeros y los almacena en la lista

b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0
como en ArmarNodo se hace un agregarAdelante entonces queda en orden inverso 0 48 13 21 10

c. Implementar un módulo que imprima los números enteros guardados en la lista generada

procedure ImprimiLista(l : lista);
begin
    while(l <> nil)do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.

procedure Incrementar(var l:lista; num:integer);
begin
    while(l <> nil)do beign
        l^.num:=l^.num+num;
        l:=l^.sig;
    end;
end;