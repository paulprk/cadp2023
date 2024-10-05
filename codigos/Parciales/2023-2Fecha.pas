program x;
const
    fin='Peso Pluma';
type
    str20=string[20];
    rangoGenero=1..5;

    sesion=record
        titulo:str20;
        nombre:str20;
        genero:rangoGenero;
        visualizacionesYT:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:sesion;
        sig:lista;
    end;

procedure CargarL(var l:lista);
    procedure leerSesion(var s:sesion);
    begin
        write('ingrese el titulo: '); readln(s.titulo);
        write('ingrese el nombre del artista: '); readln(s.nombre);
        write('ingrese el genero musical: '); readln(s.genero);
        write('ingrese la cantidad de visualizaciones en youtube: '); readln(s.visualizacionesYT);
    end;
    procedure InsertarOrdenado(var l:lista;s:sesion);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=s;
        act:=l;
        while(act <> nil)and (act^.dato.nombre < s.nombre) do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l)then
            l:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;


var
    s:sesion;
begin
    l:=nil;
    repeat
        leerSesion(s);
        InsertarOrdenado(l,s);
    until(s.nombre = fin);
end;


procedure RecorrerL(l:lista);
type
    vcont=array[rangoGenero]of integer;
    procedure IniV(var vc:vcont);
    var
        i:rangoGenero;
    begin   
        for i:=1 to 5 do
            vc[i]:=0;
    end;

    procedure CalcMax(vc:vcont);
    var
        i:rangoGenero;
        max1,max2:integer;
        cod1,cod2:integer;
    begin
        max1:=-1;   max2:=-1;
        for i:=1 to 5 do begin
            if(vc[i] > max1)then begin
                max2:=max1;
                cod2:=cod1;
                max1:=vc[i];
                cod1:=i;
            end
            else if(vc[i] > max2)then begin
                max2:=vc[i];
                cod2:=i;
            end;
        end;
        writeln('el primer genero con mas visualizaciones es: ',cod1,' y el segundo fue: ',cod2,'.');
    end;

    function ParesImpraes(visualizaciones:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(visualizaciones <> 0)do begin
            if(visualizaciones mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            visualizaciones:=visualizaciones div 10;
        end;
        ParesImpraes:=(par = impar);
    end;

var
    vc:vcont;
    Cumple:integer;
begin
    IniV(vc);
    Cumple:=0;
    while(l <> nil)do begin
        vc[l^.dato.genero]:=vc[l^.dato.genero]+l^.dato.visualizacionesYT;
        if(l^.dato.genero = 2)and (ParesImpraes(l^.dato.visualizacionesYT))then
            Cumple:=Cumple+1;
        l:=l^.sig;
    end;
    CalcMax(vc);
    writeln('la cantidad de sesiones de genero Reggaeton que cumplen con la condicion son: ',Cumple,'.');
end;

procedure eliminar(l:lista;titulo:str20;var ok:Boolean);
var
    ant,act:lista;
begin
    ok:=false;
    act:=l;
    while(act <> nil)and (act^.dato.titulo <> titulo)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)then begin
        ok:=true;
        if(act = l)then
            l:=l^.sig
        else
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;


var
    l:lista;
    titulo:str20;
    ok:Boolean;
begin
    CargarL(l);
    RecorrerL(l);
    writeln('ingrese el titulo de la sesion que desea eliminar: '); readln(titulo);
    Eliminar(l,titulo,ok);
    if(ok)then
        writeln('Se elimino')
    else 
        writeln('No se elimino');
end.