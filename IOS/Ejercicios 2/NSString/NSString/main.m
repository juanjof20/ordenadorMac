//
//  main.m
//  NSString
//
//  Created by A1-IMAC08 on 5/10/21.
//


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //1. Declara el NSString nombre y el NSNumber puesto
        NSString *nombre;
        NSNumber *puesto;
        //2. Asigna valores a puesto y nombre
        nombre = @"Juanjo";
        puesto = @404;
        //3. Imprime "Hola soy MiNombre, estoy en el puesto número X" utilizando los valores de las variables anteriores
        NSString *cadena = @"Hola soy %@, estoy en el puesto numero %@.";
        NSLog(cadena ,nombre ,puesto);
        //4. Imprime el número de caracteres de la frase anterior
        NSUInteger length = cadena.length;
        int myInt = (int) length;
        NSString *cadena4 = @"La longitud de la cadena anterior es: %d";
        NSLog(cadena4, myInt);
        //5. Imprime la primera letra
        NSString *firstChar = cadena4;
        NSRange myRange = NSMakeRange(0, 1);
        firstChar = [firstChar substringWithRange:myRange];
        NSString *cadena5 = @"Hola soy un ejemplo";
        NSLog(@"La primera letra de la cadena anterior es: %@", firstChar);
        //6. Comprobar si el String contiene la letra a
        if ([cadena5 rangeOfString:@"a"].location == NSNotFound)
        {
          NSLog(@"El String SI contiene la letra a");
        } else
        {
          NSLog(@"El String NO contiene la letra a");
        }
        //7. Contar cuántas veces contiene la letra a
        //8. Declarar array "palabras"
        NSArray *palabras =@[];
        //9. Guardar una palabra en cada posición del array
        palabras = @[@"palabra1",@"palabra2"];
        //10. Formar un NSString con las palabras del array en orden inverso
        NSArray *inverso = [[palabras reverseObjectEnumerator] allObjects];
        //11. Eliminar los primeros 3 caracteres del string. Imprimirlo.
        NSString *deleteFirst3 = [cadena5 substringWithRange:NSMakeRange(3, [cadena5 length]-3)];
        //12. Eliminar los 2 últimos caracteres del string. Imprimirlo.
        NSString *deleteLast2 = [cadena5 substringToIndex:[cadena5 length]-2];
        //14. Volver a añadir los caracteres que hemos eliminado al principio y al final
        //15. Todas las letras del string deben ser mayúsculas
        NSString *upper = [cadena5 uppercaseString];
        //16. Obtener la posición de la palabra "puesto"
        //17. Imprimir la frase "La palabra puesto está en la posición X", sustituyendo X por la posición donde se encuentra.
        //18. Definir un NSMutableString con el contenido "Hola soy una cadena"
        NSMutableString *mutable = [NSMutableString stringWithString:@"Hola soy una cadena"];
        //19. Añadir al final del string anterior " y estoy siendo modificada"
            [mutable appendString:@" y estoy siendo modificada"];
        //20. Sumar 5 al NSNumber puesto

        
    }
    return 0;
}
