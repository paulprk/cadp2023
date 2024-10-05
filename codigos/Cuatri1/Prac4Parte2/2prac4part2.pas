program dos;
const
    dF=500;
type
    rango=1..dF;
    str20=string[20];
    alumnos=array[rango]of str20;

procedure cargarV(var a:alumnos;var dL:integer);
var
    nom:str20;
begin
    dL:=0;
    write('Ingrese nombres[finzalia ZZZ]: '); readln(nom);
    while(nom<>'ZZZ')and (dL<dF)do begin
        dL+=1;
        a[dL]:=nom;
        write('Ingrese nombres[finzalia ZZZ]: '); readln(nom);
    end;
end;

procedure borrar(var a:alumnos;var dL:integer;var ok:boolean);
var
    j,i:integer;
    nom:str20;
begin
    i:=1;
    ok:=false;
    write('Ingrese un nombre(se eliminara 1 ocurrencia): '); readln(nom);
    while(i<=dL)and (not ok)do begin
        if(a[i]=nom)then
            for j:=i to (dL-1)do begin
                a[j]:=a[j+1];
            end;
            ok:=true;
            dL-=1;
    end;
end;

procedure insertar(var a:alumnos;var dL:integer);
var
    num,i:integer;
    nom:str20;
begin
    num:=4;
    if(dL<dF)then begin
        for i:=dL downto num do begin
            a[i+1]:=a[i];
        end;
        writeln('Escriba un nombre para ingresar en la posicion 4: '); readln(nom);
        a[num]:=nom;
        dL+=1;
    end;
end;

procedure agregar(a:alumnos;dL:integer);
var
    nom:str20;
begin
    writeln('Ingrese el nombre a agregar: '); readln(nom);
    if(dL<dF)then begin
        dL+=1;
        a[dL]:=nom;
    end;
end;

var
    a:alumnos;
    dL:integer;
    ok:boolean;
begin
    cargarV(a,dL);
    borrar(a,dL,ok);
    if(ok)then begin
        writeln('Se elimino');
    end
    else
        writeln('No existe');
    insertar(a,dL);
    agregar(a,dL);
end.