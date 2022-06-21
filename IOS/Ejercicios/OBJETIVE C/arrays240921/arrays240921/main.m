//
//  main.m
//  arrays240921
//
//  Created by A1-IMAC08 on 24/9/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //1. Crear un array con 10 números aleatorios.
        int list[10];
        int a, b;
        
        
        for (b = 0; b < 10; b++)
        {
            //usamos esta funcion para que nos genere un aleatorio respecto a nuestra hora, de este modo cada vez que lo hagamos los valores seran diferentes.
            srand(time(NULL));
            NSLog(@"Posicion %i numero almacenado: %i", b+1, list[b]);
        }
        
    
        
        //2. Definir un array de 20 posiciones y almacenar en él los primeros 20 números pares. Imprimir el contenido del array.
        int par[20], c;

        for (c = 0; c < 41; c++)
        {
            if (par[c] % 2 == 0)
            {
                    NSLog(@"Numeros pares: %d \n", c, par[c]);
            }
        }

        
//        int max = [[numbers valueForKeyPath:@"@max.intValue"] intValue];
        
}
    return 0;
}
