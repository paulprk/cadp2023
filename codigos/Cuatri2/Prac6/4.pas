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
    while(l <> nil)do begin
        writeln('Num:',l^.num);
        l:=l^.sig;
    end;
end;

procedure RecorrerLista(l:lista);

    procedure MaxNum(num:integer;var max:integer);
    begin
       if(num > max)then
            max:=num;
    end;

    procedure MinNum(num:integer;var min:integer);
    begin    
        if(num < min)then
           min:=num;
    end;

    procedure multiplosA(num,a:integer;var MultsA:integer);
    begin
        if((num mod a)=0)then
            MultsA:=MultsA+1;
    end;

var
    max,min,MultsA,a:integer;
begin
    max:=-9999; min:=9999; MultsA:=0;
    writeln('Ingrese Multiplo a Buscar:'); readln(a);
    while(l <> nil)do begin
        MaxNum(l^.num,max);
        MinNum(l^.num,min);
        multiplosA(l^.num,a,MultsA);
        l:=l^.sig;
    end;
    writeln('Numero Maximo Leido:',max);
    writeln('Numero Minimo Leido:',min);
    writeln('Los multiplos de ',a,' son un total:',MultsA);
end;

var
    pri : lista;
    valor,a : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0)do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    ImprimirLista(pri);
    RecorrerLista(pri);
end.