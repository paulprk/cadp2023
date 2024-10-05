program diez;
const
    dF=20;
    fin=-1;
    fin2=0;
type
    str20=string[20];
    rango=1..dF;
    rcultivos=record
        tipoCultivo:str20;
        hectareas:integer;
        mesesCiclo:integer;
    end;
    vcultivos=array[rango]of rcultivos;

    empresa=record
        codEmpre:integer;
        nomEmpre:str20;
        tipoEmpresa:str20;
        lugarUbi:str20;
        cultivo:vcultivos;
        dL:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:empresa;
        sig:lista;
    end;

procedure cargarLista(var l:lista);
    procedure leerEmpresa(var e:empresa);
        procedure leerVector(var vc:vcultivos;var dL:integer);
        var
            hectareas:integer;
        begin
            dL:=0;
            write('Ingrese la cantidad de hectareas:'); readln(hectareas);
            while(dL < dF)and (hectareas <> fin2)do begin
                dL:=dL+1;
                vc[dL].hectareas:=hectareas;
                write('Ingrese el tipo de cultivo:'); readln(vc[dL].tipoCultivo);
                write('Ingrese el ciclo de cultivo:'); readln(vc[dL].mesesCiclo);
                writeln('----------------------------------');
                write('Ingrese la cantidad de hectareas:'); readln(hectareas);
            end;
        end;

    begin
        writeln('----------------------');
        write('Ingrese el codigo de empresa:'); readln(e.codEmpre);
        if(e.codEmpre <> fin)then begin
            write('Ingrese el nombre de la empresa:'); readln(e.nomEmpre);
            write('Ingrese el tipo de empresa(Estatal o Publica):'); readln(e.tipoEmpresa);
            write('Ingrese el lugar donde la empresa radica:'); readln(e.lugarUbi);
            leerVector(e.cultivo,e.dL);
        end;
    end;
    procedure AgregarAtras(var l:lista;e:empresa);
    var
        nue,act:lista;
    begin
        new(nue);
        nue^.dato:=e;
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
    e:empresa;
begin
    l:=nil;
    leerEmpresa(e);
    while(e.codEmpre <> fin)do begin
        AgregarAtras(l,e);
        leerEmpresa(e);
    end;
end;
procedure recorrerLista(l:lista);
    function doscero(codEmpre:integer):Boolean;
    var
        cero:integer;
    begin
        cero:=0;
        while(codEmpre <> 0)do begin
            if(codEmpre mod 10 = 0)then
                cero:=cero+1;
            codEmpre:=codEmpre div 10;
        end;
        doscero:=(cero >= 2);
    end;
    procedure calcMaxMaiz(empre:empresa;mesesCiclo:integer;var max:integer;var empresaMax:empresa);
    begin
        if(mesesCiclo > max)then begin
            max:=mesesCiclo;
            empresaMax:=empre
        end;
    end;
    procedure ImpriEmpresaMax(empre:empresa);
    var
        i:integer;
    begin
        writeln('---Empresa que dedica mas tiempo al cultivo de maiz---');
        writeln('Codigo empresa:',empre.codEmpre);
        writeln('Nombre empresa:',empre.nomEmpre);
        writeln('Tipo de empresa:',empre.tipoEmpresa);
        writeln('Lugar donde radica:',empre.lugarUbi);
        writeln('--Cultivo--');
        for i:=1 to empre.dL do begin
            writeln('Hectareas total:',empre.cultivo[i].hectareas);
            writeln('Tipo de cultivo:',empre.cultivo[i].tipoCultivo);
            writeln('Meses del ciclo del cultivo:',empre.cultivo[i].mesesCiclo);
        end;
    end;

var 
    i,totalHectareas,totalSoja,max:integer;
    empresaMax:empresa;
begin
    totalHectareas:=0; totalSoja:=0; max:=-1;
    while(l <> nil)do begin
        for i:=1 to l^.dato.dL do begin
            if(l^.dato.lugarUbi = 'San Miguel del Monte')and (l^.dato.cultivo[i].tipoCultivo = 'trigo')and (doscero(l^.dato.codEmpre))then begin
                writeln('--Nombre de las empresas radicadas en san miguel del monte que cultivan trigo--');
                writeln(l^.dato.nomEmpre);
            end;
            totalHectareas:=totalHectareas+l^.dato.cultivo[i].hectareas;
            if(l^.dato.cultivo[i].tipoCultivo = 'soja')then
                totalSoja:=totalSoja+l^.dato.cultivo[i].hectareas;
            if(l^.dato.cultivo[i].tipoCultivo = 'maiz')then
                calcMaxMaiz(l^.dato,l^.dato.cultivo[i].mesesCiclo,max,empresaMax);
        end;
        l:=l^.sig;
    end;
    writeln('Cantidad d hectareas dedicadas al soja y cuanto representa frente al total de hectareas:',(totalSoja/totalHectareas * 100):0:2,'%');
    ImpriEmpresaMax(empresaMax);
end;

procedure IncrementarMes(l:lista);
var
    i:integer;
begin
    while(l <> nil)do begin
        for i:=1 to l^.dato.dL do begin
            if(l^.dato.cultivo[i].tipoCultivo = 'girasol')and (l^.dato.cultivo[i].hectareas < 5)and (l^.dato.tipoEmpresa <> 'estatal')then 
                l^.dato.cultivo[i].hectareas:=l^.dato.cultivo[i].hectareas+1;
        end;
        l:=l^.sig;
    end;
end;

var
    l:lista;
begin
    cargarLista(l);
    recorrerLista(l);
    IncrementarMes(l);
end.
