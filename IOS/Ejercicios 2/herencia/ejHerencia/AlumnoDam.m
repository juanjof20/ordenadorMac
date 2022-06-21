//
//  AlumnoDam.m
//  ejHerencia
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import "AlumnoDam.h"

@implementation AlumnoDam

//set mnethods
-(void) setNPuesto: (NSNumber*)newNPuesto
{
    nPuesto = [[NSNumber alloc]init];
    nPuesto = newNPuesto;
}

-(void) setCurso: (NSNumber*)newCurso
{
    curso = [[NSNumber alloc]init];
    if ([newCurso isEqual:@1] || [newCurso isEqual:@2])
    {
        curso = newCurso;
    }
}

//get methods
-(NSNumber*) nPuesto
{
    return nPuesto;
}

-(NSNumber*) curso
{
    return curso;
}
@end
