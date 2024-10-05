program cuatro;
const
    clientes=9300;
    min=3.40;
    mb=1.35;
type
    linea=record
        numero:integer;
        minutos:real;
        mb:real;
    end;
    cliente=record
        codigo:integer;
        cantlineas:integer;
    end;
procedure leerlinea(var l:linea);
begin
    writeln('Ingrese numero de telefono');
        readln(l.numero);
    writeln('Ingrese la cantidad de minutos al mes');
        readln(l.minutos);
    writeln('Ingrese los MB consumidos en el mes');
        readln(l.mb);
end;

procedure procesar(c:cliente);
var
    i:integer;
    totalminutos,totalmb,sumamin,sumamb:real;
    l:linea;
begin
    sumamin:=0;
    sumamb:=0;
    for i:=1 to c.cantlineas do
    begin
        totalminutos:=0;
        totalmb:=0;
        leerlinea(l);
        sumamin:=sumamin+l.minutos;
        sumamb:=sumamb+l.mb;
        totalminutos:=sumamin*min;
        totalmb:=sumamb*mb;
    end;
    writeln('Del cliente ',c.codigo,' minutos consumidos es el total de: ',totalminutos:0:2,'Min');
    writeln('Y total MB consumidos durante todo el mes: ',totalmb:0:2,'MB');
    writeln('');
end;

procedure leercliente(c:cliente);
var
    i:integer;
begin
    for i:=1 to clientes do
    begin 
        writeln('Ingrese codigo de cliente');
            readln(c.codigo);
        writeln('Ingrese la cantidad de lineas');
            readln(c.cantlineas);
        procesar(c);
    end;
end;

var
    c:cliente;
begin
    leercliente(c);
end.