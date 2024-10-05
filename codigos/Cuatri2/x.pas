{
   12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit
o a Todas las clases. Esta lista debe estar ordenada por DNI.
   
}
program puntos;
type
	tSuscrip=1..4;
	tipSus=array [tSuscrip] of string;
	cliente=record
		nombre: string;
		dni:integer;
		edad:integer;
		tipoSuscrip:tSuscrip;
		end;
	lista=^nodo;
	nodo=record
		dato:cliente;
		sig:lista;
		end;

procedure leer(var c: cliente);
begin
	writeln('DNI: '); readln(c.dni);
	if (c.dni<>0) then begin 
	writeln('nombre: '); readln(c.nombre);
	writeln('edad: '); readln(c.edad);
	writeln('tipo de suscripcion: '); readln(c.tipoSuscrip);
	end;
end;

procedure insertarOrdenado(var l:lista; c:cliente);
var
	ant,act,aux:lista;
begin
	new(aux); 
	aux^.dato:=c; 
	act:=l;
	while (act<> NIL) and (act^.dato.dni>c.dni) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (ant=act) then
		l:=aux
	else 
		ant^.sig:=aux;
	aux^.sig:=act;
	
end;

procedure cargarlista(var l:lista);
var
	c:cliente;
begin
	leer(c);
	while (c.dni<>0) do begin
		insertarOrdenado(l,c);
		leer(c);
	end;
	
end;
var
	pri:lista;
BEGIN
	pri:=NIL;
	cargarlista(pri);
	while (pri<>nil) do begin
		writeln('-------------');
		writeln('dni ', pri^.dato.dni);
		writeln('nombre ', pri^.dato.nombre);
		writeln('edad ', pri^.dato.edad);
		writeln('tipo de suscripcion ', pri^.dato.tipoSuscrip);
		pri:=pri^.sig;
	end;
end.

