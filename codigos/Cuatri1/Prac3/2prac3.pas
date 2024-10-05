
program dos;
type
    dia=1..31;
    mes=1..12;
    fecha=record
        dia:dia;
        mes:mes;
        ano:integer;
    end;
procedure leerfecha(var f:fecha);
begin
    writeln('Ingrese el ano');
        readln(f.ano);
    if(f.ano<>2020)then
    begin
        writeln('Ingrese el mes');
            readln(f.mes);
        writeln('Ingrese el dia');
            readln(f.dia);
    end;
end;

procedure veranocont(var verano:integer; var diesdias:integer);
var
    f:fecha;
begin
    leerfecha(f);
    while(f.ano<>2020)do
    begin
        if(f.mes>=1)and (f.mes<=3)then
            verano:=verano+1;
        if(f.dia<=10)then
            diesdias:=diesdias+1;
        leerfecha(f);
    end;
end;

var
    verano:integer;
    diesdias:integer;
begin
    diesdias:=0;
    verano:=0;
    veranocont(verano,diesdias);
    writeln('casamientos en verano: ', verano);
    writeln('casamientos 10 dias cada mes: ', diesdias);
end.