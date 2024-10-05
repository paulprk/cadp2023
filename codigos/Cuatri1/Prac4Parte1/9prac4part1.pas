{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}
program nueve;
const
    dimF=400;
type
    str20=string[20];
    alumno=record
        nroIns:integer;
        dni:integer;
        apellido:str20;
        nombre:str20;
        anioNac:integer;
    end;
    vectorAlumnos=array[1..dimF]of alumno;
    
procedure leer(var a:alumno);
begin
    write('Ingrese el dni: '); readln(a.dni);
    if(a.dni<>-1)then begin
        write('Ingrese el numero de inscripcion: '); readln(a.nroIns);
        write('Ingrese el apellido: '); readln(a.apellido);
        write('Ingrese el nombre: '); readln(a.nombre);
        write('Ingree la fecha de nacimiento: '); readln(a.anioNac);
        writeln('----------------------------------');
    end;
end;

procedure cargarVector(var v:vectorAlumnos;var dL:integer);
var
    a:alumno;
begin  
    leer(a);
    while(a.dni<>-1)and (dL<dimF)do begin
        dL:=dL+1;
        v[dL]:=a;
        leer(a);
    end; 
end;

function digitosPares(num:integer):boolean;
var
    esPar:boolean;
    dig:integer;
begin
    esPar:=true;
    while(num<>0)and (esPar)do begin
        dig:=num mod 10;
        if(dig mod 2=1)then
            esPar:=false;
        num:=num div 10;
    end;
    digitosPares:=esPar;
end;

procedure actualizarMin(var minDni1,minDni2:integer;var nom1,nom2,ape1,ape2:str20;nombre,apellido:str20;dni:integer);
begin
    if(dni<minDni1)then begin 
        minDni2:=minDni1;
        nom2:=nom1;
        ape2:=ape1;
        minDni1:=dni;
        nom1:=nombre;
        ape1:=apellido;
    end
    else if (dni<minDni2)then begin
        minDni2:=dni;
        nom2:=nombre;
        ape2:=apellido;  
    end;
end;

procedure procesarVector(v:vectorAlumnos;dL:integer);
var
    i,cantAlumnosDniPar,minDni1,minDni2:integer;
    nom1,nom2,ape1,ape2:str20;
begin
    cantAlumnosDniPar:=0;
    minDni1:=9999;
    for i:=1 to dL do begin
        if(digitosPares(v[i].dni))then
            cantAlumnosDniPar:=cantAlumnosDniPar+1;
        actualizarMin(minDni1,minDni2,nom1,nom2,ape1,ape2,v[i].nombre,v[i].apellido,v[i].dni);
    end;
    writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares: ',(cantAlumnosDniPar*100)/dL:0:2);
    writeln('Los 2 alumnos con mayor edad: ',nom1,' y ',nom2);
end;

var
    v:vectorAlumnos;
    a:alumno;       
    dL:integer;
begin
    dL:=0;
    cargarVector(v,dL);
    procesarVector(v,dL);
end.

