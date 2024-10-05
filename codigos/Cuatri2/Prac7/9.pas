program nueve;
const
    dF=8;
    fin=-1;
type
    vcont=array[codGen]of integer;

    str20=string[20];
    codGen=1..dF;

    pelicula=record
        codPeli:integer;
        titulo:str20;
        codGenero:codGen;
        puntajeProm:real;
    end;
    lista=^nodo;
    nodo=record
        dato:pelicula;
        sig:lista;
    end;

    critica=record
        dni:integer;
        ApeyNom:str20;
        codPeli:integer;
        puntaje:real;
    end;

procedure GenerarLista(var lPeli:lista); //se dispone

procedure ActualizarLista(l:lista;var vc:vcont);
    procedure leerCritica(var c:critica);
    begin
        write('Ingrese el codigo de pelicula(1..8):'); readln(c.codPeli);
        if(c.codPeli <> fin)then begin
            write('Ingres el DNI del critico:'); readln(c.dni);
            write('Ingrese le nombre y apellido:'); readln(c.ApeyNom);
            write('Ingrese el puntaje:'); readln(c.puntaje);
        end;
    end;
    procedure iniV(var vc:vcont);
    var
        i:codGen;
    begin
        for i:=1 to dF do
            vc[i]:=0;
    end;

var
    c:critica;
begin
    leerCritica(c);
    iniV(vc);
    while(l <> nil)and (c.codPeli <> fin)do begin
        vc[l^.dato.codGenero]:=vc[l^.dato.codGenero]+l^.dato.puntajeProm;
        l^.dato.puntajeProm:=c.puntaje;
        leerCritica(c);
        l:=l^.sig;
    end;
end;
var
    lPeli:lista;
    vc:vcont;
begin
    lPeli:=nil;
    GenerarLista(lPeli); //se dispone
    ActualizarLista(lPeli,vc);
end.