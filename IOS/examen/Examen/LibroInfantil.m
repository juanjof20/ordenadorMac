//
//  LibroInfantil.m
//  Examen
//
//  Created by A1-IMAC08 on 8/10/21.
//

#import "LibroInfantil.h"

@implementation LibroInfantil

//set methods
- (void) setEdad: (NSNumber*) newEdad
{
    edad = [[NSNumber alloc]init];
    edad = newEdad;
}

- (void) setNombre: (NSString*) newNombre andAutor: (NSString*) newAutor andLibroId: (NSNumber*) newLibroId andEdad: (NSNumber*) newEdad
{
    [self setNombre:newNombre];
    [self setAutor:newAutor];
    [self setLibroId:newLibroId];
    [self setEdad:newEdad];
}

//get methods
- (NSNumber*) edad
{
    return edad;
}

@end
