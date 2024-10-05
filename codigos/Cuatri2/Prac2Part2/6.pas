program seis;

procedure calcularMaxyMin(var max1,min1,min2:real;precio:real;cod:integer;tipo:string;var codBarato1,codBarato2,codPantalon:integer);
begin
    if(precio < min1)then begin
        min2:=min1;
        codBarato2:=codBarato1;
        min1:=precio;
        codBarato1:=cod;
    end
    else if(precio < min2)then begin
        min2:=precio;
        codBarato2:=cod;
    end;

    if(tipo='pantalon')then begin
        if(precio > max1)then begin
            max1:=precio;
            codPantalon:=cod;
        end;
    end;
end;

procedure leerDatos(precio:real;cod:integer;tipo:string;var codBarato1,codBarato2,codPantalon:integer;var promedioPrecio:real);
var
    i,productos:integer;
    suma,max1,min1,min2:real;
begin
    min1:=9999; min2:=9999; max1:=-1; productos:=0; suma:=0;
    for i:=1 to 4 do begin
        writeln('--------------------------------');
        write('Ingrese el precio del producto:'); readln(precio);
        write('Ingrese el codigo de producto:'); readln(cod);
        write('Ingrese el tipo de producto:'); readln(tipo);
        calcularMaxyMin(max1,min1,min2,precio,cod,tipo,codBarato1,codBarato2,codPantalon);
        productos+=1;
        suma+=precio;
        promedioPrecio:=suma/productos;
    end;
end;

var
    precio,promPrecio:real;
    cod,cod1,cod2,pantalonB:integer;
    tipo:string;
begin
    leerDatos(precio,cod,tipo,cod1,cod2,pantalonB,promPrecio);
    writeln('--------------------------------');
    writeln('Los codigos de los productos mas baratos son:',cod1,' y ',cod2);
    writeln('El codigo del tipo pantalon mas caro fue:',pantalonB);
    writeln('Precio Promedio:',promPrecio:0:2);
end.