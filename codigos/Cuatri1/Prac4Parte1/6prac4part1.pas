program cinco;
const
  DIMF=100;
type
  
  tVector=array[1 .. DIMF]of integer;

procedure cargarVector(var v:tVector;var dimL:integer);
var
  aux:integer;
begin
  Writeln('Ingrese un numero(finaliza 0)'); readln(aux);
  while (aux<>0) and (dimL<DIMF) do begin
      dimL:=dimL+1;          
      v[dimL]:=aux;            
      Writeln('Ingrese un numero(finaliza 0)'); readln(aux);
  end;
end;

procedure calcularMinyMax(var posMax,posMin:integer;dimL:integer;v:tVector);
var
    i,min,max:integer;
begin
    min:=9999;
    max:=-1;
    for i:=1 to dimL do begin
        if(v[i]>max)then begin
            max:=v[i];
            posMax:=i;
        end;
        if(v[i]<min)then begin
            min:=v[i];
            posMin:=i;
        end;
    end;
end;

procedure intercambio(var v:tVector;x,y:integer);
var
  aux:integer;
begin
  aux:=v[y];
  v[y]:=v[x];
  v[x]:=aux;
end;

procedure imprimirVector(v:tVector;dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    write('[ ', v[i], ' ] ');
  end;
  writeln();
end;

var
  v:tVector;
  dimL,pMin,pMax,eMin,eMax:integer;
begin
  dimL:=0;
  cargarVector(v,dimL);
  writeln('Vector cargado: ');
  imprimirVector(v,dimL);
  calcularMinyMax(pMax,pMin,dimL,v);
  eMin:=v[pMin];
  eMax:=v[pMax];
  intercambio(v,pMin,pMax);
  writeln('El elemento maximo ',eMax,' que se encontraba en la posicion ', pMax, ' fue intercambiado con el elemento minimo ',eMin, ' que se encontraba en la posicion ', pMin);
  writeln('Vector luego: ');
  imprimirVector(v,dimL);
end.