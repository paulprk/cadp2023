program ocho;
const
    fin=-1;
type
    str20=string[20];
    docente=record
        dni:integer;
        nom:str20;
        apellido:str20;
        mail:str20;
    end;
    proyecto=record
        cod:integer;
        titulo:str20;
        docent:docente;
        cantalum:integer;
        nomEsc:str20;
        localidad:str20;
    end;

procedure leerdatos(var d:docente);
begin
    write('Ingrese el DNI: ');
        readln(d.dni);
    write('Ingrese el nombre: ');
        readln(d.nom);
    write('Ingrese el apellido: ');
        readln(d.apellido);
    write('Ingrese el email: ');
        readln(d.mail);
end;
procedure leerproyecto(var p:proyecto);
begin
    write('Ingrese codigo unico: ');
        readln(p.cod);
    if(p.cod<>fin)then
    begin
        write('Ingrese el titulo: ');
            readln(p.titulo);
        writeln('---Datos del docente cordinador---');
            leerdatos(p.docent);
        writeln('----------------------------------');
        write('Cantidad de alumnos: ');
            readln(p.cantalum);
        write('Nombre de la escuela: ');
            readln(p.nomEsc);
        write('Localidad de la escuela: ');
            readln(p.localidad);
    end;
    writeln('----------------------------------');
end;
procedure calcularmaximos(var max1,max2:integer;cantAlum:integer;escAct:str20;var escMax1,escMax2:str20);
begin
    if(cantAlum>max1)then
    begin
        max2:=max1;
        max1:=cantAlum;
        escMax2:=escMax1;
        escMax1:=escAct;
    end
    else if (cantAlum>max2)then
    begin
        max2:=cantAlum;
        escMax2:=escAct;
    end;
end;

procedure titulo(p:proyecto;var titulomax:str20);
var
    pares,impares,digitos:integer;
begin
    pares:=0;
    impares:=0;
    while(p.cod<>0)do
    begin
        digitos:=p.cod mod 10;
        if (digitos mod 2=0)then
            pares+=1
        else 
            impares+=1;
        p.cod:=p.cod div 10;
    end;
        if(pares=impares)and (p.localidad='Daireaux')then
            titulomax:=p.titulo;
end;

procedure procesar();
var
    cant2020,cantEsc,cantAlum,max1,max2:integer;
    p:proyecto;
    locAct,escMax1,escMax2,escAct,titulomax:str20;
begin
    cant2020:=0;
    locAct:='';
    max1:=-2;
    max2:=-2;
    escMax1:='';
    escMax2:='';
    leerproyecto(p);
    while(p.cod<>fin)do
    begin
        locAct:=p.localidad;
        cantEsc:=0;
        cantAlum:=p.cantalum;
        escAct:=p.nomEsc;
        while(p.cod<>fin)and (locAct=p.localidad)do
        begin
            cantEsc+=1;
            cant2020+=1;
            if (p.cantalum>cantAlum)then
            begin
                cantAlum:=p.cantalum;
                escAct:=p.nomEsc;
            end;
            titulo(p,titulomax);
            leerproyecto(p);
        end;
        calcularmaximos(max1,max2,cantAlum,escAct,escMax1,escMax2);
        writeln('La cantidad de escuelas de la localidad ',locAct,' fueron: ',cantEsc);
        writeln('----------------------------------');
    end;
    writeln('Escuelas participantes en convocatoria 2020 fueron: ', cant2020);
    writeln('Las 2 escuelas con mas alumnos participantes fueron: ',escMax1,' y ',escMax2);
    writeln('Titulo con misma cantidad de pares e impares de Daireaux fue: ',titulomax);
end;

begin
    procesar();
end.