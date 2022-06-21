//
//  main.m
//  cUserDefaults
//
//  Created by A1-IMAC08 on 22/10/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        //NSDictionary
        //Inicializacion
        NSDictionary *dict;
        //NSDictionary<NSString *, NSObject *> *dict2;//esto es otro modo de inicializarlo
        
        //Asignar valores
        dict = @{@"nombre" : @"Juanjo", @"apellido" : @"de la Rosa"};
        
        //Acceso a datos
        NSString * nombre = dict[@"nombre"];
        NSString * apellido = dict[@"apellido"];
        NSLog(@"Nombre: %@, Apellido: %@", nombre, apellido);
        
        //Estamos definiendo un NSUserDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //para borar usuario, Resetear userDefaults
        [NSUserDefaults resetStandardUserDefaults];

        //Registrar datos en UserDefaults
        NSUserDefaults *user2Def = [[NSUserDefaults alloc]init];
        
        [userDefaults registerDefaults:@{@"Nombre" : @"Juanjo"}];
        
        NSString * nombreRecuperado = [userDefaults objectForKey:@"Nombre"];
        NSLog(@"El nombre es: %@", nombreRecuperado);
        
        //setObject: forKey: //Esto es para registrar objeto
        [userDefaults setObject:@[@"Juanjo", @"de la Rosa"] forKey:@"NombreCompleto"];
        NSLog(@"Nombre Completo: %@", [userDefaults arrayForKey:@"NombreCompleto"]);
        
        //Registrar y recuperar un Bool
        [userDefaults setBool:YES forKey:@"Asiste"];
        NSLog(@"Ha asistido? %d", [userDefaults boolForKey:@"Asiste"]);
        
        //Data
        [userDefaults setObject:[@"EsTech" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"Escuela"];//aqui estamos diciendo que va codificado en utf8 los datos
        NSLog(@"%@", [userDefaults dataForKey:@"Escuela"]);//por lo tanto aqui se muestra en modo datos
        
        
        NSString *data2 = [[NSString alloc]initWithData:[userDefaults dataForKey:@"Escuela"] encoding:NSUTF8StringEncoding];//aqui ya lo estamos transformando de dtos a string de nuevo para poder hacer un NSLog y que salga el nombre y no el dato.
        NSLog(@"%@", data2);
        
        [userDefaults setObject:@{@"Nombre" : @"Juanjo", @"Apellido" : @"de la Rosa"} forKey:@"nombreDict"];
        NSLog(@"%@", [userDefaults dictionaryForKey:@"nombreDict"]);
        
        [userDefaults setInteger:17 forKey:@"Diecisiete"];//dato Integer
        NSLog(@"%ld", [userDefaults integerForKey:@"Diecisiete"]);
        
        [userDefaults setFloat:10.3 forKey:@"Float"];//dato Float
        NSLog(@"%f", [userDefaults floatForKey:@"Float"]);
        
        [userDefaults setDouble:10.234234234242343 forKey:@"Double"];//dato Double
        NSLog(@"%f", [userDefaults doubleForKey:@"Double"]);
        
        [userDefaults setObject:@"EsTech" forKey:@"String"];//dato String
        NSLog(@"%@", [userDefaults stringForKey:@"String"]);
        
        [userDefaults setURL:[NSURL URLWithString:@"https://escuelaestech.es"] forKey:@"Url"];//dato NSUrl

        //Estas lineas hacen lo mismo que la linea de arriba pero desglosado.
//        NSString * webString = @"https://escuelaestech.es";
//        NSURL * webUrl = [NSURL URLWithString:webString];
//        [userDefaults setURL:webUrl forKey:@"Url"]
        
        NSLog(@"%@", [userDefaults URLForKey:@"Url"]);
            
        [userDefaults removeObjectForKey:@"String"];//estamos borrando el objeto con key String
        NSLog(@"%@", [userDefaults URLForKey:@"String"]);
        
        
    }
    return 0;
}
