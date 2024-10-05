program diecisiete;
type
    tipoEspecie=1..6;
    tipopartos=1..10;
    str20=string[20];

    conejas=record
        cod:integer;
        anio:integer;
        especie:tipoEspecie;
        nom:str20;
        partos:tipopartos;
        crias:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:conejas;
        sig:lista;
    end;

procedure cargarL(var l:lista); //se dispone
function calcularEspecies(l:lista):integer;
type
    vcont=array[tipoEspecie]of integer;
    procedure iniV(var vc:vcont);
    var
        i:tipoEspecie;
    begin
        for i:=1 to 6 do
            vc[i]:=0;
    end;

var
    vc:vcont;
    i:tipoEspecie;
    max,maxEspecie:integer;
begin
    iniV(vc); max:=-1;
    while(l <> nil)do begin
        vc[l^.dato.especie]:=vc[l^.dato.especie]+1;
        l:=l^.sig;
    end;
    for i:=1 to 6 do begin
        if(vc[i] > max)then begin
            max:=vc[i];
            maxEspecie:=i;
        end;
    end;
    calcularEspecies:=maxEspecie;
end;

procedure NuevaLista(l:lista;var l2:lista);
    procedure AgregarAtras(var l2:lista;c:conejas);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=c;
        nue^.sig:=nil;
        if(l = nil)then
            l:=nu
        else begin
            act:=l;
            while(act^.sig <> nil)do
                act:=act^.sig;
            act^.sig:=nue;
        end;
    end;
begin
    while(l <> nil)do begin
        if(l^.dato.crias > 35)then
            AgregarAtras(l2,l^.dato);
        l:=l^.sig;
    end;
end;

procedure InformarImpar(l2:lista);
    function impar(cod:integer):boolean;
    begin
        if(cod mod 2 = 0)then
            impar:=false
        else
            impar:=true;
    end;
begin
    while(l2 <> nil)do begin
        if(Impar(l^.dato.cod))and (l^.dato.anio < 2020)then
            writeln('Conejas con codigo impar nacidas antes del 2020:',l^.dato.nom);
        l2:=l2^.sig;
    end;
end;

var
    l,l2:lista;
begin
    l:=nil; l2:=nil;
    cargarL(l); //se dispone
//a) Realice una función que reciba la información de todas las conejas y retorne el número de especie que tiene la mayor cantidad de conejas.
    writeln('Especie que tiene mayor cantidad de conejas fue:',calcularEspecies(l));
//b) Realice un módulo que reciba la información de todas las conejas y retorne en una estructura adecuada las conejas que tuvieron en total más de 35 crías.
    NuevaLista(l,l2);
//c) Realice un módulo que reciba la estructura generada en b) e informe los nombres de las conejas con código impar, nacidas antes del año 2020.
    InformarImpar(l2);
end.