program uno;
const
    fin=3355;
type
    rangoGen=1..5;
    persona=record
        dni:integer;
        apeyNom:string;
        edad:integer;
        codGen:rangoGen;
    end;
    lista=^nodo;
    nodo=record
        dato:persona;
        sig:lista;
    end;

procedure cargaLista(var l:lista);
    procedure LeerPesona(var p:persona);
    begin
        writeln('----------------------');
        write('Ingrese Dni:'); readln(p.dni);
        write('Ingrese Apellido y Nombre:'); readln(p.apeyNom);
        write('Ingrese la edad:'); readln(p.edad);
        write('Ingrese el Codigo de Genero(1..5):'); readln(p.codGen);
    end;
    procedure agregarAtras(var l:lista;p:persona);
    var
        nuevo,actual:lista;
    begin
        new(nuevo);
        nuevo^.dato:=p;
        nuevo^.sig:=Nil;
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
    p:persona;
begin   
    l:=nil;
    repeat
        LeerPesona(p);
        AgregarAtras(l,p);
    until(p.dni = fin);
end;

procedure recorrerLista(l:lista);
type
    vcont=array[rangoGen]of integer;

    procedure Pares(dni:integer;var parestotal:integer);
    var
        par,impar:integer;
    begin
        par:=0; impar:=0;
        while(dni <> 0)do begin
            if(dni mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            dni:=dni div 10;
        end;
        if(par > impar)then
            parestotal:=parestotal+1;
    end;
    procedure inicializarV(var vc:vcont);
    var
        i:rangoGen;
    begin   
        for i:=1 to 5 do
            vc[i]:=0;
    end;
    procedure MasElegidos(vc:vcont;var cod1,cod2:integer);
    var
        i:rangoGen;
        max1,max2:integer;
    begin
        max1:=-1; max2:=-1;
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
    end;

var
    parestotal,cod1,cod2:integer;
    vc:vcont;
begin
    parestotal:=0;
    inicializarV(vc);
    while(l <> nil)do begin
        Pares(l^.dato.dni,parestotal);
        vc[l^.dato.codGen]:=vc[l^.dato.codGen]+1;
        l:=l^.sig;
    end;
    MasElegidos(vc,cod1,cod2);
    writeln('----------------------------');
    writeln('Cantidad de personas cuyo DNI tiene mas pares que impares:',parestotal);
    writeln('Los 2 codigos mas elegidos fueron:',cod1,' y ',cod2);
end;

procedure Eliminar(var l:lista;dni:integer;var ok:Boolean);
var
    act,ant:lista;
begin
    ok:=false;
    act:=l;
    while(act <> nil)and (act^.dato.dni <> dni)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil)and (act^.dato.dni = dni)then begin
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
    dni:integer;
    ok:Boolean;
begin
    cargaLista(l);
    RecorrerLista(l);
    write('Ingrese DNI a eliminar:'); readln(dni);
    Eliminar(l,dni,ok);
    if(ok)then
        writeln('Se encontro y elimino')
    else 
        writeln('No se encontro');
end.