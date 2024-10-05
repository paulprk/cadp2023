program trece;
type

    rango = 1..4;
    str20 = string[20];

    usuario=record
        email:str20;
        rol:rango;
        revista:str20;
        dias:integer;
    end;

    lista=^nodo;
    nodo=record
        dato:usuario;
        sig:lista;
    end;

procedure cargarLista(var l:lista);
    procedure leerUsuario(var u:usuario);
    begin
        writeln('-------------------------');
        writeln('Ingrese el email:'); readln(u.email);
        if(u.email <> '0')then begin
            writeln('Ingrese el rol(1..4):'); readln(u.rol);
            writeln('Ingrese la revista:'); readln(u.revista);
            writeln('Ingrese los dias:'); readln(u.dias);
        end;
    end;
    procedure AgregarAtras(var l:lista;u:usuario);
    var
        nuevo,actual:lista;
    begin
        new(nuevo);
        nuevo^.dato:=u;
        nuevo^.sig:=nil;
        if(l = nil)then
            l:=nuevo
        else begin
            actual:=l;
            while(actual^.sig <> nil)do 
                actual:=actual^.sig;
            actual^.sig:=nuevo;
        end;
    end;    
    
var
    u:usuario;
begin
    l:=nil;
    leerUsuario(u);
    while(u.email <> '0')do begin
        AgregarAtras(l,u);
        leerUsuario(u);
    end;
end;

procedure RecorrerLista(l:lista);
type
    vcontador=array[rango]of integer;
    procedure imprimir(u:usuario);
    begin
        writeln('---Revista Economica---');
        writeln('Usuario:',u.email);
        writeln('Dias:',u.dias);
    end;

    procedure inicializarV(var vc:vcontador);
    var
        i:rango;
    begin
        for i:=1 to 4 do
            vc[i]:=0;
    end;

    procedure imprimirV(vc:vcontador);
    var
        i:rango;
    begin
        for i:=1 to 4 do 
            writeln('Del rol ',i,' hay un total de :',vc[i]);
    end;

    procedure Maximos(u:usuario;var max1,max2:integer;var stringMax1,stringMax2:str20);
    begin
        if(u.dias > max1)then begin
            max2:=max1;
            stringMax2:=stringMax1;
            max1:=u.dias;
            stringMax1:=u.email;
        end
        else if(u.dias > max2)then begin
            max2:=u.dias;
            stringMax2:=u.email;
        end;
    end;

var
    vc:vcontador;
    max1,max2:integer;
    stringMax1,stringMax2:str20;
begin
    inicializarV(vc); max1:=-1; max2:=-1;
    while(l <> nil)do begin
    if(l^.dato.revista = 'Economica')then 
        imprimir(l^.dato);
    vc[l^.dato.rol]:=vc[l^.dato.rol]+1;
    Maximos(l^.dato,max1,max2,stringMax1,stringMax2);
    l:=l^.sig;
    end;
    imprimirV(vc);
    writeln('2 Usuarios con mas tiempo sin ingresar:',stringMax1,' y ',stringMax2);
end;

var
    l:lista;
begin
    cargarLista(l);
    RecorrerLista(l);
end.