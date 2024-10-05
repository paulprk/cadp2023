program dos;
const
    dimF=500;
type
    rango=1..dimF;
    vnoms=array[rango]of string;
    
procedure ImprimirVector(v:vnoms;dimL:integer);
var
    i:integer;
begin
    writeln('---------------');
    for i:=1 to dimL do
        writeln(v[i]);
    writeln('dimL:',dimL);
end;

procedure leerVector(var v:vnoms;var dimL:integer;nom:string);
begin
    dimL:=0;
    write('Ingrese un nombre:'); readln(nom);
    while(dimL < dimF)and (nom <> 'ZZZ')do begin
        dimL:=dimL+1;
        v[dimL]:=nom;
        write('Ingrese un nombre:'); readln(nom);
    end;
    ImprimirVector(v,dimL);
end;

procedure Eliminar(var v:vnoms;var dimL:integer;nom:string;var ok:boolean);
var
    pos,i:integer;
begin   
    pos:=1; ok:=false;
    while(pos <= dimL)and (not ok)do begin
        if(v[pos] = nom)then begin
            for i:=pos+1 to dimL do
                v[i-1]:=v[i];
            dimL:=dimL-1;
            ok:=true;
        end
        else
            pos:=pos+1;
    end;
    ImprimirVector(v,dimL);
end;

procedure Insertar(var v:vnoms;var dimL:integer;nom:string;var ok:boolean);
var
    posInsertar,i:integer;
begin
    posInsertar:=4; ok:=false;
    if(dimL+1 <= dimF)and (posInsertar >=1)and (posInsertar <= dimL) then begin
        for i:=dimL downto posInsertar do
            v[i+1]:=v[i];
        v[posInsertar]:=nom;
        dimL:=dimL+1;
        ok:=true;
    end;
    ImprimirVector(v,dimL);
end;

procedure Agregar(var v:vnoms;var dimL:integer;nom:string;var ok:boolean);
begin
    ok:=false;
    if(dimL+1 <= dimF)then begin
        dimL:=dimL+1;
        v[dimL]:=nom;
        ok:=true;
    end;
    ImprimirVector(v,dimL);
end;

var
    nom:string;
    v:vnoms;
    dimL:integer;
    ok:boolean;
begin
    leerVector(v,dimL,nom);

    write('Ingrese un nombre a eliminar:'); readln(nom);
    Eliminar(v,dimL,nom,ok);
    if(ok)then
        writeln('Se elimino')
    else
        writeln('No se encontro');

    write('Ingrese un nombre a Insertar:'); readln(nom);
    Insertar(v,dimL,nom,ok);
    if(ok)then
        writeln('Se Inserto')
    else
        writeln('No hubo espacio');

    write('Ingrese un nombre a Agregar:'); readln(nom);
    Agregar(v,dimL,nom,ok);
    if(ok)then
        writeln('Se agrego')
    else    
        writeln('No hubo espacio');
end.