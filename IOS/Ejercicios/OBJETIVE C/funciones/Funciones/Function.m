//
//  Function.m
//  Funciones
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import "Function.h"

@implementation Function

//Comprobar si es par o no
- (int) maybePar: (int) val
{
    if (val % 2 == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

//Comprobar si es divisible o no
- (int) maybeDivisible: (int) val1 other: (int) val2
{
    if (val1 % val2 == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}
@end
