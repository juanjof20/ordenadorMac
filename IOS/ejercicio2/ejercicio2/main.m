//
//  main.m
//  ejercicio2
//
//  Created by A1-IMAC08 on 23/9/21.
//

#import <Foundation/Foundation.h>
#import "maximo.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //Punteros
        int *punteroAEntero;
        double *punteroADoble;
        float *punteroAFloat;
        char *punteroACaracter;
        
        int var = 20;
        punteroAEntero = &var;
        
        NSLog(@"El valor de var: %i", var);
        NSLog(@"Direccion donde esta almacenada la variable var: %x", &var);
        NSLog(@"Direccion donde esta almacenado punteroAEntero: %x", &punteroAEntero);
        NSLog(@"Valor del punteroAEntero: %x", punteroAEntero);
        NSLog(@"Valor de *punteroAEntero: %d", *punteroAEntero);
        
        
        NSString *hola = @"Hola Mundo";
        NSLog(@"Mensaje: %@", hola);
        
        NSString *str1 = @"Hola";
        NSString *str2 = @"Mundo";
        NSString *str3;
        
        str3 = [str2 uppercaseString];
        NSLog(@"%@", str3);
        
        str3 = [str1 stringByAppendingFormat:str2];
        // De este modo se crea un espacio entre ambos string
        str3 = [str1 stringByAppendingFormat:@" %@", str2];
        NSLog(@"%@", str3);
        
        // Otra forma de unir dos string
        str3 = [[NSString alloc] initWithFormat:@"%@ %@", str1, str2];
        NSLog(@"%@", str3);
        
        //Estamos contando longitud de string
        int len;
        len = [str3 length];
        NSLog(@"%i", len);

        
    }
    return 0;
}
