program ocho;
const
    dF=7;
type
    str20=string[20];
    fechas=record
        dia:integer;
        mes:str20;
        anio:integer;
        hora:integer;
    end;
    motivoRango=1..dF;
    transferencia=record
        numOrigen:integer;
        dniOrigen:integer;
        numDestino:integer;
        dniDestino:integer;
        fecha:fechas;
        monto:real;
        motivo:motivoRango;
    end;
    lista=^nodo;
    nodo=record
        dato:transferencia;
        sig:lista;
    end;

procedure GuardarDatos(var l:lista); //se dispone

procedure GenerarNuevaLista(l:lista;var lNueva:lista);
    procedure nuevaLista(var lNueva:lista;t:transferencia);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=t;
        nue^.sig:=nil;
        act:=lNueva;
        while(act <> nil)and (act^.dato.numOrigen < t.numOrigen)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l)then
            l:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

begin
    while(l <> nil)do begin
        if(l^.dato.dniOrigen <> l^.dato.dniDestino)then
            nuevaLista(lNueva,l^.dato);
        l:=l^.sig;
    end;
end;

procedure RecorrerLista(l:lista);
type
    vcont=array[motivoRango]of integer;

    procedure IniV(var vc:vcont);
    var
        i:motivoRango;
    begin
        for i:=1 to dF do
            vc[i]:=0;
    end;
    function CalMotivo(vc:vcont):integer;
    var
        i,motivoMax:motivoRango;
        max:integer;
    begin
        max:=-1;
        for i:=1 to dF do begin
            if(vc[i] > max)then begin
                max:=vc[i];
                motivoMax:=i;
            end;
        end;
        CalMotivo:=motivoMax;
    end;
    function CalcMenosPares(numDestino:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(numDestino <> 0)do begin
            if(numDestino mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            numDestino:=numDestino div 10;
        end;
        CalcMenosPares:=(impar > par);
    end;

var
    numAct,MenosParesImpares:integer;
    totalTerceros:real;
    vc:vcont;
begin
    IniV(vc); MenosParesImpares:=0;
    while(l <> nil)do begin
        numAct:=l^.dato.numOrigen;
        totalTerceros:=0;
        while(l <> nil)and (numAct = l^.dato.numOrigen)do begin
            if(l^.dato.dniOrigen <> l^.dato.dniDestino)then begin
                totalTerceros:=totalTerceros+l^.dato.monto;
                vc[l^.dato.motivo]:=vc[l^.dato.motivo]+1;
                if(l^.dato.fecha.mes = 'Junio')and (CalcMenosPares(l^.dato.numDestino))then
                    MenosParesImpares:=MenosParesImpares+1;
            end;
            l:=l^.sig;
        end;
        writeln('El numero de cuenta "cuenta de origen" ',numAct,' transfirio un total de: ',totalTerceros:0:2,' a terceros');
    end;
    writeln('El codigo de motivo que mas transferencia tuvo a terceros fue:',CalMotivo(vc));
    writeln('Transferencias a terceros del mes de Junio el cual poseen menos pares que impares en el numero de ceunta de Destino fue un total de:',MenosParesImpares);
end;

var
    l:lista;
    lNueva:lista;
begin
    l:=Nil;
    GuardarDatos(l); //se dispone
    GenerarNuevaLista(l,lNueva);
    RecorrerLista(lNueva);
end.

