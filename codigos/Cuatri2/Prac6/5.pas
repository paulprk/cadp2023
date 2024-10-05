program cinco;
const
    fin=-1;
type

    productos = record
        cod:integer;
        descripcion:string[20];
        stockAct:integer;
        StockMin:integer;
        precio:real;
    end;

    lista=^nodo;
    nodo=record
        dato:productos;
        sig:lista;
    end;

procedure cargarLista(var l:lista);

    procedure leerP(var p:productos);
    begin
        writeln('------------------------------');
        write('Ingres el codigo:'); readln(p.cod);
        if(p.cod <> fin)then begin
            write('Ingrese la descripcion:'); readln(p.descripcion);
            write('Ingrese el Stock Actual:'); readln(p.stockAct);
            write('Ingrese el Stock Minimo:'); readln(p.StockMin);
            write('Ingres el Precio:'); readln(p.precio);
        end;
    end;

    procedure AgregarAtras(var l:lista;p:productos);
    var
        nuevo,actual:lista;
    begin
        New(nuevo);
        nuevo^.dato:=p;
        nuevo^.sig:=Nil;
        if(l = nil)then 
            l:=nuevo
        else begin
            actual:=l;
            while(actual^.sig <> nil)do   
                actual:=actual^.sig;
            actual^.sig:=nuevo;
        end;
    end;

var
    p:productos;
begin
    leerP(p);
    while(p.cod <> fin)do begin
        AgregarAtras(l,p);
        leerP(p);
    end;
end;

procedure RecorrerLista(l:lista);

    procedure CalcPorcentaje(stockAct,StockMin:integer;var porcentaje:real;var TotalProductos,menor:integer);
    begin
        if(StockMin > stockAct)then
            menor:=menor+1;
        TotalProductos:=TotalProductos+1;
        porcentaje:=(menor/TotalProductos)*100;
    end;

    procedure TresDigitosPares(cod:integer;descripcion:string);
    var
        pares:integer;
    begin
        pares:=0;
        while(cod <> 0)do begin
            if((cod mod 2)=0)then
                pares:=pares+1;
            cod:=cod div 10;
        end;
        if(pares >= 3)then
            writeln(descripcion);
    end;

    procedure CodsMAX(cod:integer;precio:real;var CodMin1,CodMin2:integer;var min1,min2:real);
    begin
        if(precio < min1)then begin
            min2:=min1;
            CodMin2:=CodMin1;
            min1:=precio;
            CodMin1:=cod;
        end
        else if(precio < min2)then begin
            min2:=precio;
            CodMin2:=cod;
        end;
    end;

var
    porcentaje,min1,min2:real;
    TotalProductos,menor,CodMin1,CodMin2:integer;
begin
    TotalProductos:=0; menor:=0; min1:=99999; min2:=99999;
    writeln('-------------------------------------');
    writeln('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares:');
    while(l <> nil)do begin
            CalcPorcentaje(l^.dato.stockAct,l^.dato.StockMin,porcentaje,TotalProductos,Menor);
            TresDigitosPares(l^.dato.cod,l^.dato.descripcion);
            CodsMAX(L^.dato.cod,l^.dato.precio,CodMin1,CodMin2,min1,min2);
        l:=l^.sig;
    end;
    writeln('-------------------------------------');
    writeln('Porcentaje de productos con stock actual por debajo de su stock minimo:',porcentaje:0:2,'%');
    writeln('Codigo de los dos productos mas economicos:',CodMin1, ' y ',CodMin2);
end;

var
    l:lista;
begin
    cargarLista(l);
    RecorrerLista(l);
end.