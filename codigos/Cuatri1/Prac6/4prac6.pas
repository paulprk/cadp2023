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

function maximo(pri:lista):integer;
var
    max:integer;
begin
    max:=0;
    while(pri<>nil)do begin
        if(pri^.num >= max)then
            max:=pri^.num;
        pri:=pri^.sig;
    end;
    maximo:=max;
end;

function minimo(pri:lista):integer;
var
    min:integer;
begin
    min:=9999;
    while(pri<>nil)do begin
        if(pri^.num < min)then
            min:=pri^.num;
        pri:=pri^.sig;
    end;
    minimo:=min;
end;

function cantmulti(pri:lista;valor:integer):integer;
var
    cant:integer;
begin
    cant:=0;
    while(pri<>nil)do begin
        if((pri^.num mod valor)=0)then
            cant+=1;
        pri:=pri^.sig;
    end;
    cantmulti:=cant;
end;

var
    pri,ult : lista;
    valor,num1,max,min,multi : integer;
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

    max:=maximo(pri);
        writeln('El elemento maximo es: ',max);

    min:=minimo(pri);
        writeln('El elemento minimo es: ',min);

    writeln('Ingrese multiplo a buscar: '); readln(multi);
        writeln('En la lista hay una cantidad de multiplos de ',multi,' total: ',cantmulti(pri,multi));
end.