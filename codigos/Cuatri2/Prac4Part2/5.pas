program cinco;
const
    dimF=2;
type
    rangoCat='A'..'F';
    rangoCiudad=1..2400;
    dias=1..31;

    fecha=record
        dia:dias;
        mes:string;
        anio:integer;
    end;

    cliente=record
        fechaContraro:fecha;
        categoria:rangoCat;
        codigoCiudad:rangoCiudad;
        montoMensual:real;
    end;

    vcliente=array[1..dimF]of cliente;


procedure cargarVector(var vc:vcliente);

    procedure leerCliente(var c:cliente);
    begin
        writeln('---------------------------');
        writeln('---Ingrese la fecha---');
        write('Ingrese el dia:'); readln(c.fechaContraro.dia);
        write('Ingrese el mes:'); readln(c.fechaContraro.mes);
        write('Ingrese el anio:'); readln(c.fechaContraro.anio);
        write('Ingrese la categoria(A..F):'); readln(c.categoria);
        write('Ingrese el codigo de ciudad:'); readln(c.codigoCiudad);
        write('Ingrese el monto mensual:'); readln(c.montoMensual);
    end;

var
    c:cliente;
    i:integer;
begin
    for i:=1 to dimF do begin
        leerCliente(c);
        vc[i]:=c;
    end;
end;

procedure CantidadContratos(vc:vcliente);
type
    vcontador=array[dias]of integer;

    procedure inicializarVector(var vc:vcontador);
    var
        i:Integer;
    begin
        for i:=1 to 31 do
            vc[i]:=0;
    end;

var
    vcontador:vcontador;
    i,max:Integer;
begin
    inicializarVector(vcontador);
    for i:=1 to dimF do begin
        vcontador[vc[i].fechaContraro.dia]:=vcontador[vc[i].fechaContraro.dia]+1;
        Contar()

end;

var
    vc:vcliente;
begin
    cargarVector(vc);
    CantidadContratos(vc);

end.