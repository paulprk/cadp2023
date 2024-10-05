program tres;
const
    dimF=5;
type
    vector=array[1..dimF]of integer;

procedure cargarV(var v:vector;var dimL:integer);
var
    i:integer;
begin
    while(dimL<dimF)do begin
        for i:=1 to dimF do begin
            dimL:=dimL+1;
            v[dimL]:=i;
        end;
    end;
end;

procedure PrimeroUltimo(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        write(v[i],' ');
    end;
    writeln();
end;

procedure UltimoPrimero(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=dimL downto 1 do begin
        write(v[i],' ');
    end;
    writeln();
end;

procedure imprimirMitad(v:vector;dimL:integer); //c
var
    i,dig:integer;
begin
    dig:=dimL div 2;
    for i:=dig downto 1 do begin
        write(v[i],' ');
    end;
    writeln();
    dig:=dig+1;
    for i:=dig to dimL do begin
        write(v[i],' ');
    end;
    writeln();
end;

procedure XoY(v:vector;dimL,x,y:integer);
var
    i:integer;
begin
    if(x<y)then begin
        for i:=x to y do begin
            write(v[i],' ');
        end;
        writeln();
    end
    else begin
        for i:=x downto y do begin
            write(v[i],' ');
        end;
    end;
    write();
end;

procedure PrimeroUltimo2(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        XoY(v,dimL,v[i],i)
    end;
    writeln();
end;

procedure UltimoPrimero2(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=dimL downto 1 do begin
        XoY(v,dimL,v[i],i);
    end;
    writeln();
end;

procedure imprimirMitad2(v:vector;dimL:integer);
var
    i,dig:Integer;
begin
    dig:=dimL div 2;
    for i:=dig downto 1 do begin
        XoY(v,dimL,v[i],i);
    end;
    writeln();
    dig:=dig+1;
    for i:=dig to dimL do
        XoY(v,dimL,v[i],i);
end;

var
    dimL:integer;
    v:vector;
begin
    dimL:=0;
    cargarV(v,dimL);
    PrimeroUltimo(v,dimL);
    UltimoPrimero(v,dimL);
    imprimirMitad(v,dimL);
    PrimeroUltimo2(v,dimL);
    UltimoPrimero2(v,dimL);
    imprimirMitad2(v,dimL);
end.