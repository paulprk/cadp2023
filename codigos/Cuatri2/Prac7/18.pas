program dieciocho;
const
    dF=12;
type
    str20=string[20];
    rangoMes=1..dF;

    venta=record
        localidad:str20;
        monto:real;
    end;
    lista=^nodo;
    nodo=record
        dato:venta;
        sig:lista;
    end;

    vventas=array[rangoMes]of lista;

procedure CargarL(var vv:vventas);
    procedure iniL(var vv:vventas);
    var
        i:rangoMes;
    begin   
        for i:=1 to dF do
            vv[i]:=nil;
    end;
    procedure leerVenta(var v:venta);
    begin
        writeln('------------------------------');
        write('Ingrese el monto:'); readln(v.monto);
        if(v.monto <> 0)then begin
            write('Ingrese la localidad:'); readln(v.localidad);
        end;
    end;
    procedure AgregarAdelante(var l:lista;v:venta);
    var
        aux:lista;
    begin
        new(aux);
        aux^.dato:=v;
        aux^.sig:=l;
        l:=aux;
    end;

var
    v:venta;
    i:rangoMes;
begin
    iniL(vv);
    for i:=1 to dF do begin
        leerVenta(v);
        while(v.monto <> 0)do begin
            agregaradelante(vv[i],v);
            leerVenta(v);
        end;
    end;
end;

procedure ImpriL(vv:vventas);
var
    i:rangoMes;
begin
    for i:=1 to dF do begin 
        writeln('----------------------------');
        writeln('Del mes:',i);
        while(vv[i] <> nil)do begin
            writeln('----');
            writeln('Monto:',vv[i]^.dato.monto:0:2);
            writeln('Localidad:',vv[i]^.dato.localidad);
            vv[i]:=vv[i]^.sig;
        end;
    end;
end;

procedure MenorFacturacion(vv:vventas;localidad:str20);
    function calcTotal(l:lista;localidad:str20):real;
    var
        TotalMesAct:real;
    begin
        TotalMesAct:=0;
        while(l <> nil)do begin
            if(l^.dato.localidad = localidad)then
                TotalMesAct:=TotalMesAct+l^.dato.monto;
            l:=l^.sig;
        end;
        calcTotal:=TotalMesAct;
    end;
    procedure CalcMin(mesAct:rangoMes;totalMesAct:real;var min1,min2:real;var mesMin1,mesMin2:rangoMes);
    begin
        if(totalMesAct < min1)then begin
            min2:=min1;
            mesMin2:=mesMin1;
            min1:=totalMesAct;
            mesMin1:=mesAct;
        end
        else if(totalMesAct < min2)then begin
            min2:=totalMesAct;
            mesMin2:=mesAct;
        end;
    end;

var
    min1,min2,totalMesAct:real;
    i,mesMin1,mesMin2:rangoMes;
begin
    min1:=9999; min2:=9999;
    for i:=1 to dF do begin
        totalMesAct:=calcTotal(vv[i],localidad);
        CalcMin(i,totalMesAct,min1,min2,mesMin1,mesMin2);
    end;
    writeln('Los 2 meses con menor facturacion de, "',localidad,'" fueron: ',mesMin1,' y ',mesMin2);
end;


var
    vv:vventas;
    localidad:str20;
begin
//a) Invoque a un módulo que lea y retorne en una estructura de datos adecuada la información de las ventas. La información se ingresa ordenada por mes. Para cada mes, la lectura finaliza al ingresar el monto 0 (que no debe procesarse).
    CargarL(vv);
    ImpriL(vv);
//b) Lea un nombre de localidad e invoque a un módulo que recibe dicho nombre y la información de las ventas, e informe los dos meses de menor facturación de esa localidad. Se debe implementar una función que reciba las ventas de un mes y una localidad y devuelva el monto total facturado de la localidad.
    writeln('Ingrese localidad:'); readln(localidad);
    MenorFacturacion(vv,localidad);
end.