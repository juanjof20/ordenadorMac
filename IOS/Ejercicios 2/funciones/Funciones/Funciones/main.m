//
//  main.m
//  Funciones
//
//  Created by A1-IMAC08 on 1/10/21.
//

//1. Crear una función que devuelva true o false según el número recibido sea par o no

//2. Dados dos números, comprobar si el primero es divisible entre el segundo. Para ello, crear una función que devuelve true si lo es, no en caso contrario.

//3. Desarrollar una función para comprobar si un año es bisiesto

//4. Escribir una función llamada “saluda”, que recibe un nombre y devuelve la frase “Hola + nombre”, por ejemplo . Llamar a la función e imprimir la respuesta.

#import <Foundation/Foundation.h>
#import "Function.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Function *instance = [[Function alloc]init];
        //Apartado 1
        int val;
        val = [instance maybePar:4];
        NSLog(@"El número introducido es: %d (0 = false,1 = true)", val);
        
        //Apartado 2
        int value;
        value = [instance maybeDivisible:10 other:5];
        NSLog(@"Para los valores introducidos: %d (0 = false,1 = true)", value);
        
        //Apartado 3
        
        
        //Apartado 4
        
    }
    return 0;
}
