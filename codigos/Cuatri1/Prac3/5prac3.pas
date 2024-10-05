program cinco;
const
    fin='ZZZ';
type
    str20=string[20];
    auto=record
        marca:str20;
        modelo:str20;
        precio:real;
    end;
procedure leerauto(var a:auto);
begin
    writeln('Ingrese la marca');
        readln(a.marca);
    if(a.marca<>fin)then
    begin
        writeln('Ingrese el modelo');
            readln(a.modelo);
        writeln('Ingrese el precio');
            readln(a.precio);
    end;
end;
procedure calcularmaximo(actual:auto;var max:auto);
begin
    if(actual.precio>max.precio)then
        max:=actual;
end;
procedure procesar(a:auto);
var
    maxAuto:auto;
    marcaAct:str20;
    cantAutos:integer;
    precioTotal:real;
begin
    maxAuto.precio:=-999;
    leerauto(a);
    while(a.marca<>fin)do
    begin
        marcaAct:=a.marca;
        precioTotal:=0;
        cantAutos:=0;
        while(a.marca<>fin)and (marcaAct=a.marca)do
        begin
            precioTotal:=precioTotal+a.precio;
            cantAutos:=cantAutos+1;
            calcularmaximo(a,maxAuto);
            leerauto(a);
        end;
        writeln('');
        writeln('El precio promedio de ',marcaAct,' es: ',precioTotal/cantAutos:0:2);
        writeln('');
    end;
    writeln('La marca de auto mas cara es: ',maxAuto.marca,' y su modelo es: ',maxAuto.modelo);
end;
var
    a:auto;
begin
    procesar(a);
end.