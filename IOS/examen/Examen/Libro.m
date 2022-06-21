//
//  Libro.m
//  Examen
//
//  Created by A1-IMAC08 on 8/10/21.
//

#import "Libro.h"

@implementation Libro

// set methods
- (void) setNombre: (NSString*)newNombre
{
    nombre = [[NSString alloc] initWithString:newNombre];
}

- (void) setAutor:(NSString *)newAutor
{
    autor = [[NSString alloc] initWithString:newAutor];
}

- (void) setLibroId:(NSNumber *)newLibroId
{
    libro_id = [[NSNumber alloc] init];
    libro_id = newLibroId;
}


//get methods
- (NSString*) nombre
{
    return nombre;
}

- (NSString*) autor
{
    return autor;
}

- (NSNumber*) libroId
{
    return libro_id;
}



@end
