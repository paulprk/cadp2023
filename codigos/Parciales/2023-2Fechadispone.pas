program x;
type
    str20=string[20];
    rangoGenero=1..5;

    sesion=record
        titulo:str20;
        nombreArtista:str20;
        genero:rangoGenero;
        estreno:integer;
        reproducciones:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:sesion;
        sig:lista;
    end;

procedure cargarL(var l:lista);  //se dispone, no ordenada

procedure recorrerL(l:lista;var l2:lista);
type
    vcont=array[rangoGenero] of Integer;
    procedure iniV(var vc:vcont);
    var
        i:rangoGenero;
    begin   
        for i:=1 to 5 do
            vc[i]:=0;
    end;
    procedure CalcMin(vc:vcont);
    var
        i:rangoGenero;
        min1,min2:integer;
        cod1,cod2:rangoGenero;
    begin
        min1:=9999; min2:=9999;
        for i:=1 to 5 do begin
            if(vc[i] < min1)then begin
                min2:=min1;
                cod2:=cod1;
                min1:=vc[i];
                cod1:=i;
            end
            else if(vc[i] < min2)then begin
                min2:=vc[i];
                cod2:=i;
            end;
        end;
        writeln('Los dos generos menos escuchados son: ',cod1,' y ',cod2);
    end;

    function sumarDigitos(num:integer):boolean;
    var
        dig,suma:integer;
    begin
        suma:=0;
        while(num <> 0)do begin
            dig:=num mod 10;
                suma:=suma+dig;
            num:=num div 10;
        end;
        sumarDigitos:=(suma mod 5 = 0);
    end;

    procedure InsertarOrdenado(var l2:lista; s:sesion);
    var
        nue,act,ant:lista;
    begin
        new(nue);
        nue^.dato:=s;
        act:=l2;
        while(act <> nil)and(act^.dato.estreno < s.estreno)do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = l2)then
            l2:=nue
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

var
    vc:vcont;
begin
    iniV(vcont);
    while(l <> nil)do begin
        vc[l^.dato.genero]:=vc[l^.dato.genero]+l^.dato.reproducciones;
        if((l^.dato.genero = 1)or (l^.dato.genero = 3))and sumarDigitos(l^.dato.reproducciones) then begin
            InsertarOrdenado(l2,l^.dato);
        end;
        l:=l^.sig;
    end;
    CalcMin(vc);
end;

procedure Informar(l2:lista);
var
    actual,totalsesiones,reproducciones:integer;
begin
    while(l2 <> nil)do begin
        actual:=l2^.dato.estreno;
        totalsesiones:=0;
        reproducciones:=0;
        while(l2 <> nil)and (l2^.dato.estreno = actual)do begin
            totalsesiones:=totalsesiones+1;
            reproducciones:=reproducciones+l2^.dato.reproducciones;
            l2:=l2^.sig;
        end;
        writeln('En el año ',actual,' se estrenaron ',totalsesiones,' sesiones y se reprodujeron ',reproducciones,' veces');
    end;
end;

var
    l,l2:lista;
begin
    l:=nil;
    l2:=nil;
    cargarL(l);
    recorrerL(l,l2);
    Informar(l2);
end.