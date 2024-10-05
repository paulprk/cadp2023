program trece;
const
    puntos=100;
    anfin=1973;
    anact=2023;
type
    cincuenta=anfin..anact;
    tpunts=1..puntos;
    
    temp=array[cincuenta,tpunts]of real;

procedure cargarV(var t:temp);
var
    i:cincuenta;
    j:tpunts;
    num:real;
begin
    for i:=anfin to anact do begin
        writeln('Anio: ',i);
        for j:=1 to puntos do begin
            write('Temperatura punto geografico ',j,': '); readln(num);
            t[i,j]:=num;
        end;
    end;
end;

procedure aniomax(anio:cincuenta;p:tpunts;var max:real;var maxanio:cincuenta;t:temp);
begin
    if(t[anio,p]>max)then begin
        max:=t[anio,p];
        maxanio:=anio;
    end;
end;

procedure aniomaxprom(prom:real;anio:cincuenta;var maxanioprom:cincuenta;var prommax:real);
begin
    if(prom>prommax)then begin
        prommax:=prom;
        maxanioprom:=anio;
    end;
end;

procedure procesarV(var maxanio,maxanioprom:cincuenta;t:temp);
var
    i:cincuenta;
    j:tpunts;
    max,maxprom,prom,suma:real;
begin
    max:=-1;
    maxprom:=-1;
    for i:=anfin to anact do begin
        suma:=0;
        prom:=0;
        for j:=1 to puntos do begin
            suma:=t[i,j]+suma;
            aniomax(i,j,max,maxanio,t);
        end;
        prom:=suma/puntos;
        aniomaxprom(prom,i,maxanioprom,maxprom);
    end;
end;

var
    max,maxanioprom:cincuenta;
    t:temp;
begin
    cargarV(t);
    procesarV(max,maxanioprom,t);
    writeln('El anio con mayor temperatura promedio fue: ',maxanioprom);
    writeln('El anio con mayor temperatura detectada en algun punto del planeta fue: ',max);
end.