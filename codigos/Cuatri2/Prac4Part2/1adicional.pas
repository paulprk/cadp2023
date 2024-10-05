program uno;
const
    dimF=500;
type
    computadora=record
        cod:integer;
        version:string;
        Instalados:integer;
        cuentasCant:integer;
    end;

    vcomputadoras=array[1..dimF]of computadora;

procedure imprimirVector(vcompu:vcomputadoras;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        writeln('--------------------------');
        writeln(vcompu[i].cod);
        writeln(vcompu[i].version); 
        writeln(vcompu[i].Instalados);
        writeln(vcompu[i].cuentasCant);
    end;
    writeln('dimL:',dimL);
end;

procedure cargarVector(var vcompu:vcomputadoras;var dimL:integer);

    procedure leerDatos(var c:computadora);
    begin
        writeln('---------------------------------');
        write('Ingrese el codigo de computadora:'); readln(c.cod);
        if(c.cod <> -1)then begin
            write('Ingrese la version de Ubuntu:'); readln(c.version);
            write('Ingrese la cantidad de paquetes Instalados:'); readln(c.Instalados);
            write('Ingrese cantidad de cuentas:'); readln(c.cuentasCant);
        end;
    end;

var
    c:computadora;
    i:integer;
begin
    dimL:=0;
    leerDatos(c);
    while(dimL < dimF)and (c.cod <> -1)do begin
        dimL:=dimL+1;
        i:=dimL;
        while(i > 1)and (i <= dimL)and (c.cod < vcompu[i-1].cod)do begin
            vcompu[i]:=vcompu[i-1];
            i:=i-1;
        end;
        vcompu[i]:=c;
        leerDatos(c);
    end;
    imprimirVector(vcompu,dimL);
end;

procedure Informar(vcompu:vcomputadoras;dimL:integer);
    function Versiones(vcompu:vcomputadoras;dimL:integer):integer;
    var
        i,cont:Integer;
    begin
        cont:=0;
        for i:=1 to dimL do begin
            if(vcompu[i].version = '16.04')or (vcompu[i].version = '18.04')then
                cont:=cont+1;
        end;
        Versiones:=cont;
    end;

    function promedioCuentas(vcompu:vcomputadoras;dimL:integer):real;
    var
        TotalCuentas,TotalUsuarios,i:integer;
    begin
        TotalCuentas:=0; TotalUsuarios:=0;
        for i:=1 to dimL do begin
            TotalUsuarios:=TotalUsuarios+1;
            TotalCuentas:=TotalCuentas+vcompu[i].cuentasCant;
        end;
        promedioCuentas:=(TotalCuentas/TotalUsuarios);
    end;

    function MaxPaquetes(vcompu:vcomputadoras;dimL:integer):string;
    var
        max,i:integer;
    begin
        max:=-1;
        for i:=1 to dimL do begin
            if(vcompu[i].Instalados > max)then begin
                max:=vcompu[i].Instalados;
                MaxPaquetes:=vcompu[i].version;
            end;
        end;
    end;

    procedure Eliminar(var vcompu:vcomputadoras;var dimL:integer);
    var
        pos,i,canteliminados:integer;
    begin
        canteliminados:=0; pos:=1;
        while(pos <= dimL)do begin
            while(pos <= dimL)and (vcompu[pos].cod >= 0)and (vcompu[pos].cod <= 500)do begin
                for i:=pos+1 to dimL do
                    vcompu[i-1]:=vcompu[i];
                canteliminados:=canteliminados+1;
                dimL:=dimL-1;
            end;
            pos:=pos+1;
        end;
        writeln('La cantidad de informacion eliminada con codigos entre 0 y 500 fueron: ',canteliminados);
    end;

begin
    writeln('-----------------------------------');
    writeln('Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04: ',Versiones(vcompu,dimL));
    writeln('Informar el promedio de cuentas de usuario por computadora: ',promedioCuentas(vcompu,dimL):0:2);
    writeln('Informar la version de Ubuntu de la computadora con mayor cantidad de paquetes instalados: ',MaxPaquetes(vcompu,dimL));
    Eliminar(vcompu,dimL);
end;

var
    vcompu:vcomputadoras;
    dimL:integer;
begin
    cargarVector(vcompu,dimL);
    Informar(vcompu,dimL);
end.