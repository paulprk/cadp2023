Program Alocacion_Dinamica;
Type
    TEmpleado = record //1+26+41+4=72 bits
        sucursal: char;
        apellido: string[25];
        correoElectronico: string[40];
        sueldo: real;
    end;
    Str50 = string[50]; //51 bits
Var
    alguien: TEmpleado; //72 bits
    PtrEmpleado: ^TEmpleado; //4 bits
Begin
{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)} 400.000-72-4
    Readln( alguien.apellido );
{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)} sigue igual 400.00-72-4
    New( PtrEmpleado ); //72 bits
{¿Cuánta memoria disponible hay ahora? (III)}   400.000-72-4-72
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
    Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
{¿Cuánta memoria disponible hay ahora? (IV)}    400.000-72-4-72
    Dispose( PtrEmpleado ); //se libera 72 bits
{¿Cuánta memoria disponible hay ahora? (V)}     400.000-72-4
end.
