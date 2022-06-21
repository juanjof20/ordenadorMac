//
//  Libro.h
//  Examen
//
//  Created by A1-IMAC08 on 8/10/21.
//

#import <Foundation/Foundation.h>

@interface Libro : NSObject
{
    NSString* nombre;
    NSString* autor;
    NSNumber* libro_id;
}

//set methods
- (void) setNombre:   (NSString*)newNombre;
- (void) setAutor:  (NSString*)newAutor;
- (void) setLibroId: (NSNumber*)newLibroId;

//get methods
- (NSString*) nombre;
- (NSString*) autor;
- (NSNumber*) libroId;

@end
