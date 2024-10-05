program seis;
type
    rango = 1..7;

    sondas = record
        nom:string[20];
        duracion:integer;
        CostoConstruccion:real;
        CostoMensual:real;
        RangoEspectro:rango;
    end;

    lista=^nodo;
    nodo = record
        dato:sondas;
        sig:lista;
    end;

procedure CargarLista(var l:lista);

    procedure leerSondas(var s:sondas);
    begin
        writeln('-------------------------------------');
        write('Ingrese el nombre:'); readln(s.nom);
        write('Ingrese la duracion estmiada:'); readln(s.duracion);
        write('Ingrese el Costo de Construccion:'); readln(s.CostoConstruccion);
        write('Ingrese el Costo de Mantenimiento Mensual:'); readln(s.CostoMensual);
        write('Ingrese el Rango de Espectro(1..7):'); readln(s.RangoEspectro);  
    end;

    procedure AgregarAtras(var l:lista;s:sondas);
    var
        nuevo,actual:lista;
    begin
        new(nuevo);
        nuevo^.dato:=s;
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
    s:sondas;
begin
    repeat
        leerSondas(s);
        AgregarAtras(l,s);
    until(s.nom = 'GAIA');
end;

procedure RecorrerLista(l:lista);
type
    VectorContador=array[rango]of integer;

    procedure MasCostosa(CostoConstruccion,CostoMensual:real;nom:string;var nomMax:string;var max:real);
    var
        suma:real;
    begin
        suma:=CostoConstruccion+CostoMensual;
        if(suma > max)then begin
            max:=suma;
            nomMax:=nom;
        end;
    end;

    procedure inicializarV(var vc:VectorContador);
    var
        i:rango;
    begin
        for i:=1 to 7 do
            vc[i]:=0;
    end;

    procedure ImprimiVector(vc:VectorContador);
    var
        i:rango;
    begin
        for i:=1 to 7 do
            writeln('El espectro ',i,' tuvo un total de sondas de:',vc[i]);
    end;

    procedure PromediosDuracion(l:lista;promedio:real;var cantidad:integer);
    begin
       while(l <> nil)do begin
            if(l^.dato.duracion > promedio)then
                cantidad:=cantidad+1;
            l:=l^.sig;
       end;
    end;

    procedure PromedioCoste(l:lista;promedioConstruccion:real;var cantConstruccion:integer);
    begin
        while(l <> nil)do begin
            if(l^.dato.CostoConstruccion > promedioConstruccion)then
                cantConstruccion:=cantConstruccion+1;
            l:=l^.sig;
        end;
    end;

var
    nomMax:string;
    max,promedio,sumaConstruccion,promedioConstruccion:real;
    vc:VectorContador;
    sumaTotal,totalSondas,cantidad,cantConstruccion:integer;
begin
    max:=-1; sumaTotal:=0; totalSondas:=0; cantidad:=0; cantConstruccion:=0; sumaConstruccion:=0;
    inicializarV(vc);
    while(l <> nil)do begin
            MasCostosa(l^.dato.CostoConstruccion,l^.dato.CostoMensual,l^.dato.nom,NomMax,max);
            vc[l^.dato.RangoEspectro]:=vc[l^.dato.RangoEspectro]+1;
            totalSondas:=totalSondas+1;

            sumaTotal:=sumaTotal+l^.dato.duracion;
            promedio:=sumaTotal/totalSondas*100;
            
            sumaConstruccion:=sumaConstruccion+l^.dato.CostoConstruccion;
            promedioConstruccion:=sumaConstruccion/totalSondas*100;
        l:=l^.sig;
    end;
    PromediosDuracion(l,promedio,cantidad);
    PromedioCoste(l,promedioConstruccion,cantConstruccion);
    writeln('----------------------------------');
    writeln('-La cantidad de sondas que realizaran estudios en cada rango del espectro electromagnetico.');
    ImprimiVector(vc);
    writeln('-El nombre de la sonda mas costosa:',nomMax);
    writeln('-La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas:',cantidad);
    writeln('El nombre de las sondas cuyo costo de construccion supera el costo promedio entre todas las sondas:',cantConstruccion);
end;

var
    l:lista;
begin
    CargarLista(l);
    RecorrerLista(l);
end.