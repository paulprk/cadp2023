program once;
const
    dF=2;
type
    str20=string[20];
    foto=record
        titulo:str20;
        autor:str20;
        like:integer;
        click:integer;
        coms:integer;
    end;
    vfoto=array[1..dF]of foto;

procedure leer(var f:foto);
begin
    write('Ingrese el titulo: '); readln(f.titulo);
    write('Ingrese el autor: '); readln(f.autor);
    write('Cantidad de likes: '); readln(f.like);
    write('Cantidad de click: ');  readln(f.click);
    write('Cantidad de comentarios: '); readln(f.coms);
    writeln('---------------------');
end;

procedure cargarV(var v:vfoto);
var
    i:integer;
begin
    for i:=1 to dF do begin
        leer(v[i]);
        writeln('Vector cargado');
    end;
end;

procedure tituloMax(var tmax:str20;v:vfoto);
var
    max,i:integer;
begin   
    max:=-1;
    for i:=1 to dF do begin
        if(v[i].click>max)then begin
            max:=v[i].click;
            tmax:=v[i].titulo;
        end;
    end;
end;

function cantMeg(v:vfoto):integer;
var
    i,cant:integer;
begin
    cant:=0;
    for i:=1 to dF do begin
        if(v[i].autor='Art Vandelay')then 
            cant:=cant+v[i].like;
    end;
    cantMeg:=cant;
end;

procedure cantcom(v:vfoto);
var
    i:integer;
begin
    for i:=1 to dF do begin
        writeln('-La foto: "',v[i].titulo,'" tiene un total de comentarios de: ',v[i].coms);
    end;
end;
{procedure leerV(v:vfoto);
var
    i:integer;
begin
    for i:=1 to dF do begin
        writeln(i,'.',v[i].titulo);
        writeln(v[i].autor);
        writeln(v[i].like);
        writeln(v[i].click);
        writeln(v[i].coms);
    end;
end;}
var
    v:vfoto;
    tmax:str20;
begin
    cargarV(v);
    tituloMax(tmax,v);
    writeln('-Titulo con mas vistas: ',tmax);
    writeln('-Cantidad de me gustas del autor Art Vandelay es: ',cantMeg(v));
    cantcom(v);
    {leerV(v);}
end.