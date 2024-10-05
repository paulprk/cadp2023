program cuatro;
const
    dimF=1000;
type
    rango=1..dimF;

    alumnos=record
        nro:integer;
        apellido:string;
        nombre:string;
        asistencia:integer;
    end;

    valumnos=array[rango]of alumnos;

procedure leerAlumno(var a:alumnos);
begin
    writeln('----------------------------');
    write('Ingrese el nro de alumno:'); readln(a.nro);
    if(a.nro <> -1)then begin
        write('Ingrese el apellido:'); readln(a.apellido);
        write('Ingrese el nombre:'); readln(a.nombre);
        write('Ingrese las asistencias:'); readln(a.asistencia);
    end;
end;

procedure cargarVector(var va:valumnos;var dimL:integer);
var
    a:alumnos;
begin
    dimL:=0;
    leerAlumno(a);
    while(a.nro <> -1)and (dimL < dimF)do begin
        dimL:=dimL+1;
        va[dimL]:=a;
        leerAlumno(a);
    end;
end;

procedure ImprimirVector(va:valumnos;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        writeln('----------------------------');
        writeln(va[i].nro);
        writeln(va[i].apellido);    
        writeln(va[i].nombre);
        writeln(va[i].asistencia);
    end;
    writeln('dimL:',dimL);
end;

procedure BuscarPosicion(va:valumnos;dimL,nro:integer;var pos:integer);
var
    posicion:integer;
begin
    posicion:=1;
    while(posicion <= dimL)and (va[posicion].nro < nro)do
        posicion:=posicion+1;
    if(posicion <= dimL)and (va[posicion].nro = nro)then
        pos:=posicion;
    ImprimirVector(va,dimL);
end;

procedure AgregarAlumno(var va:valumnos;var dimL:integer;a:alumnos;var ok:Boolean);
begin
    ok:=false;
    if(dimL < dimF)then begin
        dimL:=dimL+1;
        va[dimL]:=a;
        ok:=true;
    end;
    ImprimirVector(va,dimL);
end;

procedure Eliminar(var va:valumnos;var dimL:integer;pos:integer;var ok:boolean);
var
    i:integer;
begin
    ok:=false;
    while(pos <= dimL)do begin
        for i:=pos+1 to dimL do begin
            va[i-1]:=va[i];
        end;
        dimL:=dimL-1;
        ok:=true;
    end;
    ImprimirVector(va,dimL);
end;

procedure EliminarNro(var va:valumnos;var dimL:integer;nro:Integer;var ok:Boolean);
var
    i,pos:integer;
begin
    pos:=1; ok:=false;
    while(pos <= dimL)and (va[pos].nro <> nro)do
        pos:=pos+1;
    if(pos <= dimL)and (va[pos].nro = nro)then begin
        for i:=pos+1 to dimL do begin
            va[i-1]:=va[i];
        end;
        dimL:=dimL-1;
        ok:=true;
    end;
    ImprimirVector(va,dimL);
end;

procedure EliminarAsistencia(var va:valumnos;var dimL,eliminados:integer;var ok:Boolean);
var
    pos,i:integer;
begin
    ok:=False; pos:=1; eliminados:=0;
    while(pos <= dimL)do begin
        while(pos <= dimL)and (va[pos].asistencia <> 0)do 
            pos:=pos+1;
        if(pos <= dimL)and (va[pos].asistencia = 0)then begin
            for i:=pos+1 to dimL do begin
                va[i-1]:=va[i];
            end;
            dimL:=dimL-1;
            eliminados:=eliminados+1;
            ok:=true;
        end;
    end;
    ImprimirVector(va,dimL);
end;

var
    va:valumnos;
    nro,dimL,pos,eliminados:integer;
    a:alumnos;
    ok:boolean;
begin
    cargarVector(va,dimL);

    write('Ingrese nro de alumno a buscar:'); readln(nro);
    BuscarPosicion(va,dimL,nro,pos);
    writeln('Se encuentra en la posicion: ',pos);

    leerAlumno(a);
    AgregarAlumno(va,dimL,a,ok);
    if(ok)then
        writeln('Se pudo Agregar')
    else
        writeln('No hubo espacio');

    write('Ingrese la posicion del alumnos a eliminar:'); readln(pos);
    Eliminar(va,dimL,pos,ok);
    if(ok)then
        writeln('Se elimino')
    else
        writeln('No se elimino');

    write('Ingrese el nro de alumno a eliminar:'); readln(nro);
    EliminarNro(va,dimL,nro,ok);
    if(ok)then
        writeln('Se elimino')
    else
        writeln('No hubo espacio o no existe');

    EliminarAsistencia(va,dimL,eliminados,ok);
    if(ok)then
        writeln('Se eliminaron alumnos con asistencias 0 total: ',eliminados)
    else
        writeln('No habian alumnos con asistencias 0');
end.