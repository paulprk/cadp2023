program uno;
type
    rango=1..500;

    num=array[rango]of integer;

function Encontrar(vnum:num;dimL,n:integer):boolean;
var
    i:integer
begin
    for i:=1 to dimL do begin
        if(vnum[i] = n)then
            Encontrar:=true
        else
            Encontrar:=false;
    end;
end;

function EncontrarB(vnum:num;dimL,n:integer):boolean;
var
    pos:integer;
begin
    pos:=1;
    while(pos <= dimL)and (vnum[pos] < n)do
        pos:=pos+1;
    if(pos <= dimL)then begin
        if(vnum[pos] = n)then
            EncontrarB:=true
        else
            Encontrar:=false;
    end;
end;

var
    vnum:num;
    dimL,n:integer;
begin
    write('Valor a buscar:'); readln(n);
    EncontrarA(vnum,dimL,n);
    EncontrarB(vnum,dimL,n);
end.