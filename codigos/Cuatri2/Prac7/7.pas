program siete;
const
    dF=24;
    fin=-1;
type
    str40=string[40];
    rango=1..dF;
    vnotas=array[rango]of integer;

    alumno=record
        numAlumno:integer;
        ApeyNom:str40;
        email:str40;
        ingreso:Integer;
        egreso:integer;
        notas:vnotas;
    end;
    lista=^nodo;
    nodo=record
        dato:alumno;
        sig:lista;
    end;

procedure cargarLista(var l:lista);
    procedure leerAlumno(var a:alumno);
    var
        nota:integer;
        i:rango;
    begin
        writeln('----------------------------------');
        write('Ingres el numero de alumno:'); readln(a.numAlumno);
        if(a.numAlumno <> fin)then begin
            write('Ingrese los apellidos y nombres:'); readln(a.ApeyNom);
            write('Ingrese la direccion de correo electronico:'); readln(a.email);
            write('Ingrese el anio de ingreso:'); readln(a.ingreso);
            write('Ingres el anio de egreso:'); readln(a.egreso);
            for i:=dF downto 1 do begin
                write('Ingrese la nota ',i,':'); readln(nota);
                a.notas[i]:=nota;
            end;
        end;
    end;
    procedure AgregarAtras(var l:lista;a:alumno);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=a;
        nue^.sig:=nil;
        if(l = nil)then
            l:=nue
        else begin
            act:=l;
            while(act^.sig <> nil)do
                act:=act^.sig;
            act^.sig:=nue;
        end;
    end;
    
var
    a:alumno;
begin
    l:=nil;
    leerAlumno(a);
    while(a.numAlumno <> fin)do begin
        AgregarAtras(l,a);
        leerAlumno(a);
    end;
end;
procedure recorrerLista(l:lista);
    procedure PromedioNotas(vn:vnotas;NomyApe:str40);
    var
        i:rango;
        SumaNotas:integer;
    begin
        SumaNotas:=0;
        for i:=1 to dF do
            SumaNotas:=SumaNotas+vn[i];
        writeln('El promedio del alumno: ',NomyApe,' es de: ',(SumaNotas/dF):0:2);
    end;
    function ok(numAlumno:integer):boolean;
    var
        par:boolean;
    begin
        par:=false;
        while(numAlumno <> 0)and (par = false)do begin
            if(numAlumno mod 2 = 0)then
                par:=true;
            numAlumno:=numAlumno div 10;
        end;
        ok:=(par=false);
    end;
    procedure MasRapidoRecibieron(a:alumno;ingreso,egreso:integer;var min1,min2:integer;var AlumnoMin1,AlumnoMin2:alumno);
    begin
        if((egreso-ingreso) < min1)then begin
            min2:=min1;
            AlumnoMin2:=AlumnoMin1;
            min1:=(egreso-ingreso);
            AlumnoMin1:=a;
        end
        else if((egreso-ingreso) < min2)then begin
            min2:=(egreso-ingreso);
            AlumnoMin2:=a;
        end;
    end;
var
    cumpleImpares,min1,min2:integer;
    AlumnoMin1,AlumnoMin2:alumno;
begin   
    cumpleImpares:=0; min1:=9999; min2:=9999;
    writeln('---Promedio de notas Obtenida por cada alumno---');
    while(l <> nil)do begin
        PromedioNotas(l^.dato.notas,l^.dato.ApeyNom);
        if(l^.dato.egreso = 2012)and (ok(l^.dato.numAlumno))then
            cumpleImpares:=cumpleImpares+1;
        MasRapidoRecibieron(l^.dato,l^.dato.ingreso,l^.dato.egreso,min1,min2,AlumnoMin1,AlumnoMin2);
        l:=l^.sig;
    end;
    writeln('--------------------------------');
    writeln('Cantidad de ingresantes del 2012 con solo digitos impares en su DNI:',cumpleImpares);
    writeln('--Apellido, nombres y direccion de corre electronico de los 2 alumnos que mas rapido se recibieron--');
    writeln('Alumno 1, con nombre:',AlumnoMin1.ApeyNom,' y correo:',AlumnoMin1.email);
    writeln('Alumno 2, con nombre:',AlumnoMin2.ApeyNom,' y correo:',AlumnoMin2.email);
end;

procedure EliminarAlumno(var l:lista;numAlumno:integer;var okey:Boolean);
var
    act,ant:lista;
begin
    okey:=False;
    act:=l;
    while(act <> nil)and (act^.dato.numAlumno <> numAlumno)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)then begin
        okey:=true;
        if(act = l)then
            l:=l^.sig
        else
            ant^.sig:=act^.sig;
        dispose(act);
end;
    end;

var
    l:lista;
    numAlumno:integer;
    okey:Boolean;
begin
    cargarLista(l);
    recorrerLista(l);
    writeln('--------------------------------');
    write('Ingrese numero de Alumno a eliminar:'); readln(numAlumno);
    EliminarAlumno(l,numAlumno,okey);
    if(okey)then
        writeln('Se elimino el Alumno')
    else
        writeln('No se encontro el Alumno, no se elimino');
end.