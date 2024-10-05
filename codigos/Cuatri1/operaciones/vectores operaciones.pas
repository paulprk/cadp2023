procedure agregarV(var v:vector;var dL:integer;var ok:boolean;valor:integer);
begin
    ok:=false;
    if((dL+1)<=dF)then begin
        ok:=true;
        dL+=1;
        v[dL]:=valor;
    end;
end;

procedure insertarV(var v:vector;var dL:integer;var pude:boolean;pos:integer;valor:integer);
var
    i:integer;
begin
    pude:=false;
    if((dL+1)<=dF)and (pos>=1)and (pos<=dL)then begin
        for i:=dL downto pos do 
            v[i+1]:=v[i];
        pude:=true;
        a[pos]:=valor;
        dL+=1;
    end;
end;

procedure eliminarV(var v:vector;var dL:integer;var exito:boolean;pos:integer);
var
    i:integer;
begin
    exito:=false;
    if(pos>=1)and (pos<=dL)then begin
        for i:=pos to (dL-1)do 
            v[i]:=v[i+1];
        exito:=true;
        dL-=1;
    end;
end;

function busquedaDesordenada(v:vector;dL:integer;numBuscar:integer):boolean;
var
    pos:integer;
    ok:boolean;
begin
    pos:=1;
    ok:=false;
    while(pos<=dL)and (not ok)do begin
        if(v[pos]=valor)then
            ok:=true
        else
            pos+=1;
    end;    
    busquedaDesordenada:=ok; 
end;

function busquedaMejoradaOrdenados(v:vector;dL:integer;valorbuscar:integer):boolean;
var
    pos:integer;
    pude:boolean;
begin
    pos:=1;
    while((pos<=dL)and (a[pos]<num))do begin
        pos+=1;
    end;
    if((pos<=dL)and (a[pos]=num))then
        pude:=true
    else
        pude:=False;
    busquedaMejoradaOrdenados:=pude;
end;


function busquedaBinaria(v:vector;dL:integer;numbuscar:integer):boolean;
var
    pri,ult,medio:integer;
    ok:boolean;
begin
    ok:=false;
    pri:=1; ult:=dL; medio:=(pri+ult)div 2;
    while(pri<ulti)and (numbuscar<>v[medio])do begin
        if(numbuscar<v[medio])then
            ult:=medio-1
        else
            pri:=medio+1;
        medio:=(pri+ult)div 2;
    end;
    if(pri<=ult)and (numbuscar=v[medio])then
        ok:=true;
    busquedaBinaria:=ok; 
end;

procedure ordenar(var v:vecto;var dL:integer);
var
    i,j,p,item:integer;
begin
    for i:=1 to (dL-1) do begin
        p:=i;
        for j:=i+1 to dL do
            if(v[j]<v[p])then
            p:=j;
        item:=v[p];
        v[p]:=v[i];
        v[i]:=item;
    end;
end;





