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
    valor,num : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    //imprimirLista(pri);
    //writeln('Ingrese numero a sumar: ); readln(num);
    //incrementarValor(pri,num)
end.

{a.indicar que hace el programa
    esta leyendo una secuencia de numeros y los va agregando delante
b.Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0
    0,48,13,21,10
c.Implementar un módulo que imprima los números enteros guardados en la lista generada
}
procedure imprimirLista(pri:lista);
begin
    while(l<>nil)do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

//d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
procedure incrimentarValor(var pri:lista;num:integer);
begin
    while(l<>nil)do begin
        l^.num:=l^.num+num;
        l:=l^.sig;
    end;
end;

                                