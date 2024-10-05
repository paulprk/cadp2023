program veinte;
const
    dF=1500;
    fin=-1;
type
    str20=string[20];
    rangoTema=1..10;
    rangoLibros=1..dF;
    libro=record
        titulo:str20;
        autoPP:str20;
        anioEdicion:integer;
        tema:rangoTema;
    end;
    VLibros=array[rangoLibros]of libro;

//----------------------------------------------------

    RFecha=record
        dia:integer;
        mes:integer;
        anio:integer;
    end;
    RPrestamo=record
        codLibro=integer;
        fecha:RFecha;
    end;
    VPrestamos=array[rangoLibros]of RPrestamo;

    socio=record
        num:integer;
        email:str20;
        prestamos:VPrestamos;
        dL:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:socio;
        sig:lista;
    end;

//----------------------------------------------------

    SocioVeinte=record
        num:integer;
        prestamos:integer;
    end;
    lista2=^nodo2;
    nodo2=record
        dato2:SocioVeinte;
        sig2:lista2;
    end;

//----------------------------------------------------

    vcont=array[rangoTema]of Integer;

//----------------------------------------------------

procedure CargarLibros(var VL:VLibros); //se dispone

//----------------------------------------------------

procedure CargarL(var l:lista);
    procedure leerSocio(var s:socio);
        procedure LeerPrestamos(var VP:VPrestamos;var dL:Integer);
        var
            RP:RPrestamo;
        begin
            dL:=0;
            write('Ingrese el codigo de libro(1..1500):'); readln(RP.codLibro);
            while(rp.codLibro <> fin)and (dL < dF)do begin
                dL:=dL+1;
                vp[dL].codLibro:=rp.codLibro;
                Write('Ingrese el dia:'); readln(RP.fecha.dia);
                vp[dL].fecha.dia:=RP.fecha.dia;
                Write('Ingrese el mes:'); readln(RP.fecha.mes);
                VP[dL].fecha.mes:=rp.fecha.mes;
                Write('Ingrese el anio:'); readln(RP.fecha.anio);
                VP[dL].fecha.anio:=rp.fecha.anio;
                write('Ingrese el codigo de libro(1..1500):'); readln(RP.codLibro);
            end;
        end;

    begin
        write('Ingres el numero de socio(fin -1):'); readln(s.num);
        if(s.num <> fin)then begin
            write('Ingrese el email:'); readln(s.email);
            LeerPrestamos(s.prestamos,s.dL);
        end;
    end;
    procedure agregarAtras(var l:lista;s:socio);
    var
        act,nue:lista;
    begin
        new(nue);
        nue^.dato:=s;
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
    s:socio;
begin
    l:=nil;
    leerSocio(s);
    while(s.num <> fin)do begin
        AgregarAtras(l,s);
        leerSocio(s);
    end;
end;

//----------------------------------------------------

procedure Recorrer(l:lista;var l2:lista2;var vc:vcont;VL:VLibros);
    procedure AgregarAtrasNueva(var l2:lista2;numSocio:integer;prestamos:integer);
    var
        nue,act:lista2;
    begin
        new(nue);
        nue^.dato2.num:=numSocio;
        nue^.dato2.prestamos:=prestamos;
        nue^.sig2:=nil;
        if(l2 = nil)then
            l2:=nue
        else begin
            act:=l2;
            while(act^.sig2 <> nil)do
                act:=act^.sig2;
            act^.sig2:=nue;
        end;
    end;
    procedure iniV(var vc:vcont);
    var
        i:rangoTema;
    begin
        for i:=1 to 10 do
            vc[i]:=0;  
    end;

var
    i:rangoLibros;
    prestamosTotal:integer;
begin
    l2:=nil;
    iniV(vc);
    prestamosTotal:=0;
//a)i
    while(l <> nil)do begin
        if(l^.dato.dL > 20)then
            AgregarAtrasNueva(l2,l^.dato.num,l^.dato.dL);
        prestamosTotal:=prestamosTotal+l^.dato.dL;
        l:=l^.sig;
    end;
//a)ii
    for i:=1 to dF do
        vc[vl[i].tema]:=vc[vl[i].tema]+1;
    writeln('El total de prestamos realizados por la biblioteca fue de:',prestamosTotal);
end;

//----------------------------------------------------

procedure RecorrerVC(vc:vcont;var maxTema:rangoTema);
var
    max:integer;
    i:rangoTema;
begin
    max:=-1;
    for i:=1 to 10 do begin
        if(vc[i] > max)then begin
            max:=vc[i];
            maxTema:=i;
        end;
    end;
end;

//----------------------------------------------------

procedure RecorrerLValor(l:lista;valor:integer);
    function ParImpar(numSocio:integer):boolean;
    var
        par,impar:integer;
    begin
        par:=0;  impar:=0;
        while(numSocio <> 0)do begin
            if(numSocio mod 2 = 0)then
                par:=par+1
            else
                impar:=impar+1;
            numSocio:=numSocio div 10;
        end;
        ParImpar:=(par = impar);
    end;
    
begin
    while(l <> nil)do begin
        if(ParImpar(l^.dato.num))and (l^.dato.dL = valor)then
            writeln('Numero de socio:',l^.dato.num);
        l:=l^.sig;
    end;
end;

//----------------------------------------------------

var
    VL:VLibros;
    l:lista;
    l2:lista2;
    vc:vcont;
    maxTema:rangoTema;
    valor:integer;
begin
    CargarLibros(VL);   //se dispone
//a)
    CargarL(l);
//a)i,ii,iii
    RecorrerL(l,l2,vc,VL);
//b)
    RecorrerVC(vc,maxTema);
    writeln('El numero de tema con mayor cantidad de prestamos fue:',maxTema);
//c)
    writeln('Ingrese un valor:'); readln(valor);
    RecorrerLValor(l,valor);
end.