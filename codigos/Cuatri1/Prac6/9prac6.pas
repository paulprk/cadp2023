program nueve;
type
    list=^nodo;
    nodo=record
        num:integer;
        next:list;
    end;

procedure makeNodo(var f:list;value:integer);
var
    aux:list;
begin
    new(aux);
    aux^.num:=value;
    aux^.next:=f;
    f:=aux;
end;

function IsOrdered(f:list):Boolean;
var
    prev:list;
begin
    prev:=f;
    while(f<>nil)and (prev^.num <= f^.num)do begin
        prev:=f;
        f:=f^.next;
    end;
    IsOrdered:=(f=nil);
end;

procedure delete(var f:list;valueDelete:integer);
var
    aux,prev:list;
begin
    if(f<>nil)and (f^.num=valueDelete)then
        f:=f^.next;
    aux:=f; prev:=f;
    while(aux<>nil)do begin
        if(aux^.num=valueDelete)then begin
            prev^.next:=aux^.next;
            dispose(aux);
            aux:=prev^.next;
        end
        else begin
            prev:=aux;
            aux:=aux^.next;
        end;
    end;
end;

procedure SubList(f:list;num1,num2:integer;var fMax:list);
begin
    while(f<>nil)do begin
        if(f^.num > num1)and (f^.num < num2)then
            makeNodo(fMax,f^.num);
        f:=f^.next;
    end;
end;

procedure SubListUp(f:list;num1,num2:integer;var fMax:list);
begin
    while(f<>nil)and (f^.num < num2)do begin
        if(f^.num > num1)then
            makeNodo(fMax,f^.num);
        f:=f^.next;
    end;
end;

procedure SubListDown(f:list;num1,num2:integer;var fMax:list);
begin
    while(f<>nil)and (f^.num > num1)do begin
        if(f^.num < num2)then
            makeNodo(fMax,f^.num);
        f:=f^.next;
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
    first,firstMax:list;
    value,valueDelete,num1,num2:integer;
    ok:Boolean;
begin
    first:=nil; firstMax:=nil;
    writeln('Ingrese un numero: '); readln(value);
    while(value<>0)do begin
        makeNodo(first,value);
        writeln('Ingrese un numero: '); readln(value);
    end;
    writeln('---------------------------');
    ok:=IsOrdered(first); //a
    if(ok)then
        writeln('Esta Ordenada')
    else
        writeln('NO esta ordenada');

    writeln('Ingrese valor a eliminar: '); readln(valueDelete); //b
    delete(first,valueDelete); 

    writeln('Ingrese primero numero: '); readln(num1);
    writeln('Ingrese segundo numero: '); readln(num2);
    SubList(first,num1,num2,firstMax); //c

    SubListUp(first,num1,num2,firstMax); //d

    SubListDown(first,num1,num2,firstMax);// e

    writeln('----------------------------');
    writeln('Los elementos de la lista son');
    printL(first);
    writeln('----------------------------');
    Writeln('Los numeros mayores que ',num1,' y menores que ',num2,' son');
    printL(firstMax);
end.
