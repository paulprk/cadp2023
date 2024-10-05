program doceb;
const
    precioTn=320;
type
    rango=1..3;

procedure TresFebrero(localidad:string;ha:integer;zona:rango;var cant:integer);
var
    precioEstimado:real;
begin   
    precioEstimado:=ha*precioTn;
    if(precioEstimado > 10000)then
        cant+=1;
end;

procedure MayorEstimado(var localidadMax:string;var max:real;localidad:string;ha:Integer);
var
    precioEstimado:real;
begin
    precioEstimado:=ha*precioTn;
    if(precioEstimado > max)then begin
        max:=precioEstimado;
        localidadMax:=localidad;
    end
end;

procedure MenorEstimado(var localidadMin:string;var min:real;localidad:string;ha:integer);
var
    precioEstimado:real;
begin
    precioEstimado:=ha*precioTn;
    if(precioEstimado < min)then begin
        min:=precioEstimado;
        localidadMin:=localidad;
    end;
end;

procedure CalcProm(ha:integer;var precioTotal:real;var total:integer);
var
    precioEstimado:real;
begin
    precioEstimado:=ha*precioTn;
    precioTotal+=precioEstimado;
    total+=1;
end;

var
    localidad,localidadMax,localidadMin:string;
    ha,cant,total:integer;
    zona:rango;
    max,min,precioTotal:real;
begin
    cant:=0; max:=-1; min:=999999; total:=0; precioTotal:=0;
    repeat
    writeln('----------------------------------');
    write('Ingrese la localidad:'); readln(localidad);
    write('Ingrese la cantidad de hectareas sembradas:'); readln(ha);
    write('Ingrese la zona:'); readln(zona);
    if(localidad = 'Tres de Febrero')then
        TresFebrero(localidad,ha,zona,cant);
    MayorEstimado(localidadMax,max,localidad,ha);
    MenorEstimado(localidadMin,min,localidad,ha);
    CalcProm(ha,precioTotal,total);
    until(localidad = 'Saladillo')and (ha = 900);
    writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000: ',Cant);
    writeln('La localidad del campo con mayor rendimiento economico esperado: ',localidadMax);
    writeln('La localidad del campo con menor rendimiento economico esperado: ',localidadMin);
    writeln('El rendimiento economico promedio: ',(precioTotal/total):0:2);
end.