program uno;
const
    dF=500;
type
    rango=1..dF;
    vector=array[rango]of integer;

procedure cargarV(var v:vector;var dL:integer);
var
    num:integer;
begin
    dL:=0;
    write('Ingrese un numeros(finazalia 0): '); readln(num);
    while(dL<dF)and (num<>0)do begin
        dL+=1;
        v[dL]:=num;
        write('Ingrese un numeros(finaliza 0): '); readln(num);
    end;
end;

function encontrarN(v:vector;dL,num:integer):Boolean;
var
    i:integer;
    ok:Boolean;
begin
    ok:=false;
    i:=0;
    while(i<dL)and (not ok)do begin
        i+=1;
        if(v[i]=num)then 
            ok:=True;
    end;
    encontrarN:=ok;
end;

var
    v:vector;
    dL,num:integer;
    ok:Boolean;
begin
    cargarV(v,dL);
    write('Ingrese numero a buscar: '); readln(num);
    ok:=encontrarN(v,dL,num);
    if(ok=true)then
        write('Se encontro el numero')
    else
        write('No se encontro el numero');
end.
