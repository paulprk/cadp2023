program nueve;
const
    finish=1200;

procedure ApellidoMin(inscripcion:integer;var min1,min2:integer;var ApeMin1,ApeMin2:string;apellido:string);
begin
    if(inscripcion < min1)then begin
        min2:=min1;
        ApeMin2:=ApeMin1;
        min1:=inscripcion;
        ApeMin1:=apellido
    end
    else if(inscripcion < min2)then begin
        min2:=inscripcion;
        ApeMin2:=apellido;
    end;
end;

procedure NombMax(inscripcion:integer;var max1,max2:integer;var nomMax1,nomMax2:string;nombre:string);
begin
    if(inscripcion > max1)then begin
        max2:=max1;
        nomMax2:=nomMax1;
        max1:=inscripcion;
        nomMax1:=nombre;
    end
    else if(inscripcion > max2)then begin
        max2:=inscripcion;
        nomMax2:=nombre;
    end;
end;

function porcentaje(alumnos,alumnospar:integer):real;
begin
    porcentaje:=alumnospar/alumnos;
end;

var
    inscripcion,min1,min2,max1,max2,alumnos,alumnospar:integer;
    apellido,nombre,ApeMin1,ApeMin2,nomMax1,nomMax2:string;
    porcentajepar:real;
begin
    min1:=9999; min2:=9999; max1:=-1; max2:=-1; porcentajepar:=0; alumnos:=0; alumnospar:=0;
    repeat
        write('Ingrese el numero de inscripcion: '); readln(inscripcion);
        write('Ingrese el nombre: '); readln(nombre);
        write('Ingrese apellido: '); readln(apellido);
        alumnos+=1;
        if((inscripcion mod 2)=0)then
            alumnospar+=1;
        ApellidoMin(inscripcion,min1,min2,ApeMin1,ApeMin2,apellido);
        NombMax(inscripcion,max1,max2,nomMax1,nomMax2,nombre);
        porcentajepar:=porcentaje(alumnos,alumnospar);
    until(inscripcion = finish);
    writeln('Apellido de los 2 alumnos con numero de inscripcion mas chico: ',ApeMin1,' y ',ApeMin2);
    writeln('Nombre de los 2 alumnos con numero de inscripcion mas grande: ',nomMax1,' y ',nomMax2);
    writeln('Porcentaje de alumnos con nro de inscripcion par: ',porcentajepar:0:2,'%');
end.