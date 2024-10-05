program cinco;
type
    Rproductos=record
        cod:integer;
        desc:string;
        stockAct:integer;
        stockMin:integer;
        precio:real;
    end;

    lista=^nodo;
    nodo=record
        dato:Rproductos;
        sig:lista;
    end;
//guardar datos=================================
procedure agregarAdelante(var pri:lista;r:Rproductos);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=r;
    nuevo^.sig:=pri;
    pri:=nuevo;
end;

procedure leerR(var r:Rproductos);
begin
    write('Ingrese codigo de producto: '); readln(r.cod);
    if(r.cod<>-1)then begin
        write('Ingrese descripcion del producto: '); readln(r.desc);
        write('Ingrese stock Actul: '); readln(r.stockAct);
        write('Ingrese Stock minimo: '); readln(r.stockMin);
        write('Ingrese precio: '); readln(r.precio);
    end;
    writeln('---------------------------');
end;

procedure cargarL(var pri:lista);
var
    r:Rproductos;
begin
    pri:=nil;
    leerR(r);
    while(r.cod<>-1)do begin
        agregarAdelante(pri,r);
        leerR(r);
    end;
end;
//busqueda de datos===========================================
procedure menorAstkMin(var cant,minstock:integer;pri:lista);
begin
    cant+=1;
    if(pri^.dato.stockAct < pri^.dato.stockMin)then
        minstock+=1;
end;

function porcentaje(productos,minstock:integer):real;
var
    Total:real;
begin
    if(productos<>0)then
        Total:=(minstock*100)/productos
    else
        Total:=0;
    porcentaje:=Total;
end;

//3 digitos pares
function ParesT(num:integer):Boolean;
var
    pares:integer;
begin
    pares:=0;
    while(num<>0)and (pares<3)do begin
        if((num mod 2)=0)then
            pares+=1;
        num:=num div 10;
    end;
    ParesT:=(pares>=3);
end;

//minimos

procedure minimos(var min1,min2:integer;pri:lista);
begin
    if(pri^.dato.precio < min1)then begin
        min2:=min1;
        min1:=pri^.dato.cod;
    end
    else if(pri^.dato.precio < min2)then
        min2:=pri^.dato.cod;
end;

procedure recorridoP(var porcentajeStock:real;var pri:lista;var min1,min2:integer);
var
    productos,minstock:integer;
begin
    productos:=0; minstock:=0;
    while(pri<>nil)do begin
        //porcentaje
        menorAstkMin(productos,minstock,pri);
        //3 pares
        if(ParesT(pri^.dato.cod))then
            writeln(pri^.dato.desc,' tiene al menos tres pares');
        //minimos
        minimos(min1,min2,pri);
        //avanza lista
        pri:=pri^.sig;
    end;
    porcentajeStock:=porcentaje(productos,minstock);
end;


var
    pri:lista;
    porcentajeStock:real;
    min1,min2:integer;
begin
    cargarL(pri);
    min1:=9999;
    min2:=9999;
    recorridoP(porcentajeStock,pri,min1,min2);
        writeln('El porcentaje de productos con stock actual debajo del minmo son: ',porcentajeStock:0:2,'%');
        writeln('Los 2 productos mas baratos fueron: ',min1,' y ',min2);
end.