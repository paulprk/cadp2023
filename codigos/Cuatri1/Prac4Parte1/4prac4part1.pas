program cuatro;
const
    dF=100;
type
    vector=array[1..dF]of integer;

procedure cargarV(var v:vector);
var
    i:integer;
begin
    for i:=1 to dF do
        v[i]:=i;
end;

function posicion(v:vector;x:integer):integer;
var
    pos:integer;
begin
    pos:=1;
    while(pos<=dF)and (v[pos]<>x)do begin
        pos:=pos+1;
    end;
    if(pos>dF)then
        posicion:=-1
    else
        posicion:=pos;
end;

procedure intercambio(var v:vector;x,y:integer);
var
    aux:integer;
begin
    aux:=v[x];
    v[x]:=v[y];
    v[y]:=aux;
end;

function suma(v:vector):integer;
var
    i,sumaTotal:integer;
begin
    sumaTotal:=0;
    for i:=1 to dF do begin
        sumaTotal:=sumaTotal+v[i];
    end;
    suma:=sumaTotal;
end;

function promedio(v:vector):real;
var
    prom:real;
    i:integer;
begin
    prom:=0;
    for i:=1 to dF do begin
        prom:=prom+v[i];
    end;
    promedio:=prom/dF;
end;

function max(v:vector):integer;
var
    i,max,pos:integer;
begin
    max:=-1;
    for i:= 1 to dF do begin
        if(v[i]>max)then begin
            max:=v[i];
            pos:=i;
        end;
    end;
    max:=pos;
end;

function min(v:vector):integer;
var
    i,min,pos:integer;
begin
    min:=101;
    for i:=1 to dF do begin
        if(v[i]<min)then begin
            min:=v[i];
            pos:=i;
        end;
    end;
    min:=pos;
end;

var
    v:vector;
    x,y:integer;
begin
    readln(x);
    cargarV(v);
    posicion(v,x);
    intercambio(v,x,y);
    suma(v);
    promedio(v);
    max(v);
    min(v);
end.