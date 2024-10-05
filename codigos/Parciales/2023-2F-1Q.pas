program x;
const
    fin='Peso Pluma';
type
    str20=string[20];
    RangoGenero=1..5;

    sesion=record
        titulo:str20;
        nombre:str20;
        genero:RangoGenero;
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
        write('Ingres el titulo:'); readln(s.titulo);
        write('Ingrese el nombre del artista:'); readln(s.nombre);
        write('Ingrese el genero musical(1..5):'); readln(s.genero);
        write('Ingrese la cantidad de visualizaciones en Youtube:'); readln(s.visualizacionesYT);
    end;
    procedure InsertarOrdenado(var l:lista;s:sesion);
    var
        nue,act,ant:lista;
    begin   
        new(nue);
        nue^.dato:=s;
        act:=l;
        while(act <> nil)and (act^.dato.titulo < s.titulo)do begin
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
    repeat
        leerSesion(s);
        InsertarOrdenado(l,s);
    until(s.nombre = fin);
end;


procedure RecorrerL(l:lista);
type
    vcont=array[RangoGenero]of integer;
    procedure iniV(var vc:vcont);
    var
        i:RangoGenero;
    begin   
        for i:=1 to 5 do 
            vc[i]:=0;
    end;
    procedure calcMax(vc:vcont);
    var
        i:RangoGenero;
        max1,max2,cod1,cod2:integer;
    begin
        max1:=-1;   max2:=-1;   cod1:=0; cod2:=0;
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
        writeln('los generos con mas visualizaciones son: ',cod1,' y ',cod2);
    end;
    function ParImpar(num:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(num <> 0)do begin
            if(num mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            num:=num div 10;
        end;
        ParImpar:=(par = impar);
    end;

var
    vc:vcont;
    cumple:Integer;
begin
    iniV(vc);
    cumple:=0;
    while(l <> nil)do begin
        vc[l^.dato.genero]:=vc[l^.dato.genero]+l^.dato.visualizacionesYT;
        if(l^.dato.genero = 2)and (ParImpar(l^.dato.visualizacionesYT))then
            cumple:=cumple+1;
        l:=l^.sig;
    end;
    calcMax(vc);
    writeln('La cantidad de sesiones de genero 2 que cumplen con la condicion es: ',cumple);
end;

procedure eliminar(var l:lista;titulo:str20;var ok:Boolean);
var
    ant,act:lista;
begin   
    act:=l;
    ok:=false;
    while(act <> nil)and (act^.dato.titulo < titulo)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato.titulo = titulo)then begin
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
    writeln('Ingrese un titulo a eliminar:'); readln(titulo);
    eliminar(l,titulo,ok);
    if(ok)then
        writeln('Se elimino')
    else 
        writeln('No se encontro y no se elimino');
end.