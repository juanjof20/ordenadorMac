//
//  AlumnoDamTest.m
//  ejHerencia
//
//  Created by A1-IMAC08 on 1/10/21.
//

#import "AlumnoDamTest.h"
#import "AlumnoDam.h"

int main (int argc, const char * argv[])
{
    //Alumno de la clase AlumnoDam
    AlumnoDam * newAlumno = [[AlumnoDam alloc] init];
    [newAlumno setNombre:@"JUAN"];
    [newAlumno setFNacimiento:@"01/02/1003"];
    [newAlumno setNPuesto:@001];
    [newAlumno setCurso:@1];
    
    NSLog(@"Este alumno se llama %@, nació el %@; su numero de puesto es el %@ y esta matriculado en el curso %@", [newAlumno nombre], [newAlumno fNacimiento], [newAlumno nPuesto], [newAlumno curso]);
    
    return 0;
}
