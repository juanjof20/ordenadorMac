//
//  Alumno.m
//  ejHerencia
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import "Alumno.h"

@implementation Alumno

// set methods
- (void) setNombre: (NSString*)newNombre
{
    nombre = [[NSString alloc] initWithString:newNombre];
}

- (void) setFNacimiento:(NSString *)newFNacimiento
{
    fNacimiento = [[NSString alloc] initWithString:newFNacimiento];
}

//get methods
- (NSString*) nombre
{
    return nombre;
}

- (NSString*) fNacimiento
{
    return fNacimiento;
}

@end
