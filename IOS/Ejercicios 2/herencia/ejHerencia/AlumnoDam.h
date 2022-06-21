//
//  AlumnoDam.h
//  ejHerencia
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import <Foundation/Foundation.h>
#import "Alumno.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlumnoDam : Alumno
{
    NSNumber * nPuesto;
    NSNumber * curso;
}

//set methods
-(void) setNPuesto: (NSNumber*)newNPuesto;
-(void) setCurso: (NSNumber*)newCurso;


//get methods
-(NSNumber*) nPuesto;
-(NSNumber*) curso;

@end

NS_ASSUME_NONNULL_END
