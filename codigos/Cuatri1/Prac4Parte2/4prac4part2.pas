program cuatro;
const
    dF=5;
type
    rango=1..dF;
    str20=string[20];
    alumno=record
        nro:integer;
        ape:str20;
        nom:str20;
        asis:integer;
    end;

    vector=array[rango]of alumno;

procedure leer(var a:alumno);
begin
    with a do begin
        write('Ingrese el nro de alumno(finaliza 0): '); readln(nro);
        if(nro<>0)then begin
            write('Ingrese el apellido: '); readln(ape);
            write('Ingrese el nombre: '); readln(nom);
            write('Ingrese la cantidad de asistencias: '); readln(asis);
        end;
    end;
    writeln('--------------------------');
end;    

procedure cargarv(var v:vector;var dL:integer);
var
    a:alumno;
begin
    dL:=0;
    leer(a);
    while(a.nro<>0)and (dL<dF)do begin
        dl+=1;
        v[dL]:=a;
        leer(a);
    end;
end;

//a

function posicion(v:vector;numero:integer):integer;
var
    pos:integer;
begin
    pos:=1;
    while(v[pos].nro<>numero)do begin
        pos+=1;
    end;
    posicion:=pos;
end;

//b

procedure insertar(var v:vector;var dL:integer;var ok:boolean;pos:integer);
var
    i:integer;
    a:alumno;
begin
    ok:=false;
    if((dL+1)<=dF)and (pos>=1)and (pos<=dL)then begin
        writeln('--------------------------');
        leer(a);
        for i:=dL downto pos do
            v[i+1]:=v[i];
        ok:=true;
        v[pos]:=a;
        dl+=1;
    end;
end;

//c

procedure eliminarpos(var v:vector;var dL:integer;var pude:boolean;poselim:integer);
var
    i:integer;
begin
    pude:=false;
    if(poselim>=1)and (poselim<=dL)then begin
        for i:=poselim to (dL-1) do
            v[i]:=v[i+1];
        pude:=true;
        dL-=1;
    end;
end;

//d

procedure eliminaralu(var v:vector;var dL:integer;var can:boolean;nroalum:integer);
var
    i,j:integer;
begin
    can:=false;
    i:=0;
    while(i<dL)and (not can)do begin
        i+=1;
        if(v[i].nro=nroalum)then begin
            for j:=i to (dL-1)do 
                v[j]:=v[i+1];
        can:=true;
        dL-=1;
        end;
    end;
end;

//e

procedure eliminar_cero(var v:vector;var dL,cant:integer;var ican:boolean);
var
    i,j:integer;
begin
    cant:=0;
    ican:=false;
    for i:=1 to dL do begin
        if(v[i].asis=0)then begin
            cant+=1;
            for j:=i to (dL-1)do
                v[j]:=v[j+1];
        ican:=true;
        end;
    end;
end;

var
    dL,posnum,numero,pos,poselim,nroalum,cant:integer;
    v:vector;
    ok,pude,can,ican:boolean;
begin
    cargarv(v,dL);
    //a
        write('1.Ingrese nro de alumno a buscar: '); readln(numero);
    posnum:=posicion(v,numero);
        writeln('El numero a buscar se encuentra en la poisicon: ',posnum);
        writeln('--------------------------');
    //b
        write('2.Ingrese la posicion en la que quiere ingresa un nuevo alumno: '); readln(pos);
    insertar(v,dL,ok,pos);
    if(ok)then
        writeln('Se pudo agregar')
    else
        writeln('No se pudo agregar');
    writeln('--------------------------');
    //c
        write('3.Ingrese posicion a eliminar: '); readln(poselim);
    eliminarpos(v,dL,pude,poselim);
    if(pude)then
        writeln('Se elimino')
    else
        writeln('No se elimino');
    writeln('--------------------------');
    //d
        write('4.Ingrese nro de alumno a eliminar: '); readln(nroalum);
    eliminaralu(v,dL,can,nroalum);
    if(can)then
        writeln('Se elimino el alumno con ese nro')
    else
        writeln('No se elimino');
    writeln('--------------------------');
    //e
    eliminar_cero(v,dL,cant,ican);
    if(ican)then
        write('Se eliminaron ',cant,' alumnos');
end.