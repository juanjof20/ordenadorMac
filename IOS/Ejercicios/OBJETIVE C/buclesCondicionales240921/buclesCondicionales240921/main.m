//
//  main.m
//  buclesCondicionales240921
//
//  Created by A1-IMAC08 on 24/9/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //1. Que escriba los múltiplos de 7 entre 0 y 50.
        int x;
        
        do
        {
            x++;
            if (x % 7 == 0)
            {
                NSLog(@"Multiplos de 7 < 50: %i \n", x);
            }
        }
        while (x <= 50);
        
        //2. Que calcule cuántos múltiplos de 11 hay entre 0 y 100.
        int once, cont;
        
        for (once = 0; once <= 100; once++)
        {
            if (once % 11 == 0)
            {
                cont++;
            }
        }
        NSLog(@"2. Hay %i multiplos de 11\n", cont);
        
        //3. Dado un número, nos diga si es par, impar o 0.
        int num;
        printf("3. Introduzca un numero: ");
        scanf("%d", &num);

        if(num % 2 == 0)
        {
            NSLog(@"3. %d es par \n", num);
        } else if (num % 2 != 0)
        {
            NSLog(@"3. %d es impar \n", num);
        } else
        {
            NSLog(@"3. %d es cero \n", num);
        }
        
        //4. Que escriba las tablas de multiplicar del 0 al 10.
        int a, b;
        
        for (a = 1; a <=10; a++)
        {
            for (b = 1; b <= 10; b++)
            {
              int resul = a * b;
                NSLog(@"4. %d x %d = %d \n", a, b, resul);
            }
        }
        
        //5. Que calcule un número aleatorio entre 1 y 100.
        int numRandom = arc4random_uniform(74)+1;
        NSLog(@"5. Numero generado aleatoriamente entre 1 y 100: %i \n", numRandom);
        
        //6. Que calcule la media de 10 números aleatorios.
        float sumaRand, mediaRand, rand, c;
        
        for (c = 0; c <= 10; c++)
        {
            rand = arc4random_uniform(20); //20 por no dejarlo arc4random() y que salga un numero muy grande
            sumaRand = rand + rand;
            mediaRand = sumaRand / 10;
        }
        NSLog(@"6. La media entre los numeros generados aleatoriamente es: %f \n", mediaRand);
        
        //7. Que calcule el máximo común divisor de dos números (a y b).
        int num1, num2, num1A, num2A, result;
        printf("7. Introduzca un numero A: ");
        scanf("%d", &num1);
        printf("7. Introduzca un numero B: ");
        scanf("%d", &num2);
        
        if (num1>num2)
        {
            num1A = num1;
            num2A = num2;
        } else
        {
            num2A = num1;
            num1A = num2;
        }
        
        do
        {
            result = num2A;
            num2A = num1A % num2A;
            num1A = result;
        } while (num2A != 0);
        
        NSLog(@"El maximo comun divisor es: %i", result);
        
        //8. Que escriba los primeros 25 dígitos de la sucesión de Fibonacci.
        int d, e = 0, f = 1, g;

        for(d=0; d<25; d++)
        {
            g = e + f;
            NSLog(@"8. Numeros de Fibonacci: %i", g);
            e = f;
            f = g;
        }
    }
    return 0;
}
