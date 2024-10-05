program doce;
const
    dF=3;
type
    str20=string[20];
    galax=record
        nombre:str20;
        tipo:integer;
        masa:real;
        distancia:integer;
    end;
    galaxias=array[1..dF]of galax;

procedure leer(var g:galax);
begin
    write('Ingrese nombre de galaxia: '); readln(g.nombre);
    write('Ingrese tipo: '); readln(g.tipo);
    write('Ingrese masa(kg): '); readln(g.masa);
    write('Ingrese distancia parsecs(pc): '); readln(g.distancia);
    writeln('------------------');
end;

procedure cargarV(var v:galaxias);
var
    i:integer;
begin
    for i:=1 to dF do begin
        leer(v[i]);
        writeln('Ok');
    end;
end;

procedure leerIgualTipo(v:galaxias; var cant1,cant2,cant3,cant4:integer);
var
    i:integer;
begin
    cant1:=0; cant2:=0; cant3:=0; cant4:=0;
    for i:=1 to dF do begin
        if(v[i].tipo=1)then begin
            cant1:=cant1+1;
        end
        else if(v[i].tipo=2)then begin
            cant2:=cant2+1;
        end
        else if(v[i].tipo=3)then begin
            cant3:=cant3+1;
        end
        else if(v[i].tipo=4)then begin
            cant4:=cant4+1;
        end;
    end;
end;

procedure masa(v:galaxias; var masaprincipal,masatotal,porcentaje:real);
var
    i:integer;
begin
    masaprincipal:=0;
    masatotal:=0;
    porcentaje:=0;
    for i:=1 to dF do begin
        if(v[i].nombre='Via Lactea')or (v[i].nombre='Andromeda')or (v[i].nombre='Triangulo')then begin
            masaprincipal:=masaprincipal+v[i].masa;
        end;
        masatotal:=masatotal+v[i].masa;
        porcentaje:=(masaprincipal*100)/masatotal;
    end;
end;

function noIrregulares(v:galaxias):integer;
var
    cant,i:integer;
begin
    cant:=0;
    for i:=1 to dF do begin
        if(v[i].tipo<>4)and (v[i].distancia<1000)then
            cant:=cant+1;
    end;
    noIrregulares:=cant;
end;

procedure mayorMasa(v:galaxias;var max1,max2:string;var masamax1,masamax2:real);
var
    i:integer;
begin
    masamax1:=0; masamax2:=0;
    max1:=''; max2:='';
    for i:=1 to dF do begin
        if(v[i].masa>masamax1)then begin
            masamax2:=masamax1;
            max2:=max1;
            masamax1:=v[i].masa;
            max1:=v[i].nombre;
        end
        else if(v[i].masa>masamax2)then begin
            masamax2:=v[i].masa;
            max2:=v[i].nombre;
        end;
    end;
end;

procedure menorMasa(v:galaxias;var min1,min2:string;var masamin1,masamin2:real);
var
    i:integer;
begin
    masamin1:=9999; masamin2:=9999;
    min1:=''; min2:='';
    for i:=1 to dF do begin
        if(v[i].masa<masamin1)then begin
            masamin2:=masamin1;
            min2:=min1;
            masamin1:=v[i].masa;
            min1:=v[i].nombre;
        end
        else if(v[i].masa<masamin2)then begin
            masamin2:=v[i].masa;
            min2:=v[i].nombre;
        end;
    end;
end;

var
    v:galaxias;
    cant1,cant2,cant3,cant4:integer;
    masaprincipal,masatotal,porcentaje:real;
    max1,max2,min1,min2:str20;
    masamax1,masamax2,masamin1,masamin2:real;
begin
    cargarV(v);
    leerIgualTipo(v,cant1,cant2,cant3,cant4);
    masa(v,masaprincipal,masatotal,porcentaje);
    mayorMasa(v,max1,max2,masamax1,masamax2);
    menorMasa(v,min1,min2,masamin1,masamin2);
    writeln('---------------------------------------');
    writeln('La cantidad de galaxias de cada tipo son');
    writeln();
    writeln('[1] Eliptica: ',cant1);
    writeln('[2] Espiral: ',cant2);
    writeln('[3] Lenticular: ',cant3);
    writeln('[4] Irregular: ',cant4);
    writeln('---------------------------------------');
    writeln('La masa total de las 3 principales galaxias es: ',masaprincipal:2:2);
    writeln('---------------------------------------');
    writeln('Porcentaje del total de la masa acumulada de las 3 principales galaxias: ',porcentaje:2:2,'%');
    writeln('---------------------------------------');
    writeln('Las galaxias no irregulares que estan a menos de 1000 parsecs(pc) son: ',noIrregulares(v));
    writeln('---------------------------------------');
    writeln('Las 2 galaxias con mayor masa son: ',max1,' y ',max2);
    writeln('Con una masa de: ',masamax1:2:2,' y ',masamax2:2:2);
    writeln('---------------------------------------');
    writeln('Las 2 galaxias con menor masa son: ',min1,' y ',min2);
    writeln('Con una masa de: ',masamin1:2:2,' y ',masamin2:2:2);
    writeln('---------------------------------------');
end.