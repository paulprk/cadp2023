program docea;
type
    rango=1..3;

procedure calcularRendimiento(ha:integer;zona:rango;precioTonelada:real;var rendimientoEspe,PrecioEspe:real);
begin
    if(zona = 1)then begin
        rendimientoEspe:=6*ha;
        PrecioEspe:=rendimientoEspe*precioTonelada;
    end;
    if(zona = 2)then begin
        rendimientoEspe:=2.6*ha;
        PrecioEspe:=rendimientoEspe*precioTonelada;
    end;
    if(zona = 3)then begin
        rendimientoEspe:=1.4*ha;
        PrecioEspe:=rendimientoEspe*precioTonelada;
    end;
end;

var
    ha:integer;
    zona:rango;
    precioTonelada,rendimientoEspe,PrecioEspe:real;
begin
    write('Ingrese la cantidad de hectareas:'); readln(ha);
    write('Ingrese el tipo de zona de siembra:'); readln(zona);
    write('Ingrese el precio:'); readln(precioTonelada);
    calcularRendimiento(ha,zona,precioTonelada,rendimientoEspe,PrecioEspe);
    writeln('El rendimiento Esperado es: ',rendimientoEspe:0:2,' con precio de: ',PrecioEspe:0:2);
end.