program tres;
const
    unesco=23.435;
    totalescuelas=2;
type
    str20=string[20];
    escuela=record
        cue:integer;
        nombre:str20;
        docentes:integer;
        alumnos:real;
        lugar:str20;
    end;

procedure leer(var e:escuela);
begin
    writeln('Ingrese codigo unico de establecimiento');;
        readln(e.cue);
    writeln('Ingrese nombre del establecimiento');
        readln(e.nombre);
    writeln('Cantidad de docentes');
        readln(e.docentes);
    writeln('Cantidad de alumnos');
        readln(e.alumnos);
    writeln('Ingrese localidad');
        readln(e.lugar);
end;

function relaciona_d(e:escuela):real;
begin
    relaciona_d:=e.alumnos/e.docentes;
end;

procedure total();
var
    e:escuela;
    i,cantescuelas:integer;
    relacion,maxrela1,maxrela2:real;
    cuemax1,cuemax2:integer;
    maxescuela1,maxescuela2:str20;
begin
    cantescuelas:=0;
    maxrela1:=-1;
    for i:=1 to totalescuelas do
    begin
        leer(e);
        relacion:=relaciona_d(e);
        if(e.lugar='La Plata')and (relacion>unesco)then
            cantescuelas:=cantescuelas+1;

        if(relacion>maxrela1)then
        begin
            cuemax2:=cuemax1;
            maxescuela2:=maxescuela1;
            cuemax1:=e.cue;
            maxescuela1:=e.nombre;
            maxrela2:=maxrela1;
            maxrela1:=relacion;
        end
        else if(relacion>maxrela2)then
        begin
            cuemax2:=e.cue;
            maxescuela2:=e.nombre;
            maxrela2:=relacion;
        end;
    end;
    writeln('Escuelas con relacion alumnos-docente superior a la de la unesco: ', cantescuelas);
    writeln(''); 
    writeln('CUE y nombres 2 escuelas con mejor relacion:');
    writeln('Primera: ',cuemax1,'-',maxescuela1);
    writeln('Segunda: ',cuemax2,'-',maxescuela2);
end;

begin
    total();
end.