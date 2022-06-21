//
//  maximo.m
//  ejercicio2
//
//  Created by A1-IMAC08 on 23/9/21.
//

#import "maximo.h"

@implementation maximo

- (int) maximo: (int) n1 otro: (int) n2
{
    int result;
    
    if  (n1 > n2)
    {
        result = n1;
    } else
        {
            result = n2;
        }
    
    return result;
}

@end
