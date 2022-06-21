//
//  LibroInfantil.h
//  Examen
//
//  Created by A1-IMAC08 on 8/10/21.
//

#import "Libro.h"

@interface LibroInfantil : Libro
{
    NSNumber* edad;
}

//set methods
- (void) setEdad: (NSNumber*)newEdad;

- (void) setNombre: (NSString*) newNombre andAutor: (NSString*) newAutor
        andLibroId: (NSNumber*) newLibroId andEdad: (NSNumber*) newEdad;

//get methods
- (NSNumber*) edad;
@end
