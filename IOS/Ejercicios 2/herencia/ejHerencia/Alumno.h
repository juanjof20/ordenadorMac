//
//  Alumno.h
//  ejHerencia
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import <Foundation/Foundation.h>

@interface Alumno : NSObject
{
    NSString* nombre;
    NSString* fNacimiento;
}

// set methods
- (void) setNombre:   (NSString*)newNombre;
- (void) setFNacimiento:  (NSString*)newFNacimiento;

// get methods
- (NSString*) nombre;
- (NSString*) fNacimiento;

@end
