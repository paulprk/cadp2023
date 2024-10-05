program ocho;
type
    list=^nodo;
    nodo=record
        num:integer;
        next:list;
    end;

procedure InsertSorted(var f:list;value:integer);
var
    aux,current,prev:list;
begin
    new(aux);
    aux^.num:=value;
    aux^.next:=nil;
    if(f=nil)then //si esta vacio agregar uno nuevo
        f:=aux
    else begin
        current:=f;
        prev:=f;
        while(current<>nil)and (current^.num < aux^.num)do begin  //recorrer hasta donde este el numero
            prev:=current;
            current:=current^.next;
        end;
        if(current=f)then begin //Si es que tiene que ser agregado de primero
            aux^.next:=f;
            f:=aux;
        end
        else if(current<>nil)then begin //Si es que tiene que ser agregado en un posicion X
            prev^.next:=aux;
            aux^.next:=current;
        end
        else begin //Si es que tiene que ser agregado al final
            prev^.next:=aux;
            aux^.next:=nil;
        end;
    end;
end;


procedure printL(f:list);
begin
    while(f<>nil)do begin
        writeln(f^.num);
        f:=f^.next;
    end;
end;

var
    first:list;
    value:integer;
begin
    first:=nil;
    writeln('Ingrese un numero: '); readln(value);
    while(value<>0)do begin
        InsertSorted(first,value);
        writeln('Ingrese un numero: '); readln(value);
    end;
    writeln('---------------------------');
    printL(first);
end.