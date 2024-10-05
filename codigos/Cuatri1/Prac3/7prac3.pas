program siete;
type
    str20=string[20];
    centrosInv=record
        nombre:str20;
        universidad:str20;
        investigadores:integer;
        becados:integer;
    end;
procedure leer(var c:centrosInv);
begin
    with c do
    begin
        write('Ingrese cantidad de investigadores: ');
            readln(investigadores);
        if(investigadores<>0)then
        begin
            write('Ingrese nombre del centro: ');
                readln(nombre);
            write('Ingrese la universidad: ');
                readln(universidad);
            write('Ingrese la cantidad de becados: ');
                readln(becados);
        end;
        writeln('--------------------------------');
    end;
end;

procedure calcularmaximo(cantinvestigadores:integer;var max1:integer;uniAct:str20;var uniMax:str20);
begin
    if(cantinvestigadores>max1)then
    begin
        max1:=cantinvestigadores;
        uniMax:=uniAct;
    end;
end;

procedure calcularminimos(var min1,min2:integer;cantbecados:integer;var centroMin1,centroMin2:str20;centroAct:str20);
begin
    if(cantbecados<min1)then
    begin
        min2:=min1;
        min1:=cantbecados;
        centroMin2:=centroMin1;
        centroMin1:=centroAct;
    end
    else if(cantbecados<min2)then
    begin
        min2:=cantbecados;
        centroMin2:=centroAct;
    end;
end;

procedure procesar();
var
    c:centrosInv;
    uniAct,uniMax,centroMin1,centroMin2,centroAct:str20;
    cantcentros,max1,cantinvestigadores,cantbecados,min1,min2:integer;
begin
    max1:=-1;
    min1:=9999;
    min2:=9999;
    uniMax:='';
    centroMin1:='';
    centroMin2:='';
    centroAct:='';
    cantbecados:=0;
    leer(c);
    while(c.investigadores<>0)do
    begin
        uniAct:=c.universidad;
        cantcentros:=0;
        cantinvestigadores:=0;
        cantbecados:=c.becados;
        centroAct:=c.nombre;
        while(c.investigadores<>0)and (uniAct=c.universidad)do
        begin
            cantcentros+=1;
            if (c.becados<cantbecados)then
            begin
                cantbecados:=c.becados;
                centroAct:=c.nombre;
            end;
            cantinvestigadores+=cantinvestigadores;
            leer(c);
        end;
        calcularmaximo(cantinvestigadores,max1,uniAct,uniMax);
        calcularminimos(min1,min2,cantbecados,centroMin1,centroMin2,centroAct);
        writeln('La cantidad de centros de investigacion de ',uniAct,' son: ',cantcentros);
        writeln('--------------------------------');
    end;
    writeln('La universidad con mas cantidad de investigadores en su centro es: ',uniMax);
    writeln('Los 2 centros con menos becados fue: ',centroMin1,' y ',centroMin2);
end;

begin
    procesar();
end.