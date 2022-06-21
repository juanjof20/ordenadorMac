//
//  ViewController.m
//  peticionesAPIS
//
//  Created by A1-IMAC08 on 5/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self peticionPost];
    
    //[self peticionGet];
    
}

- (void)peticionPost
{
    // Creamos un objeto NSURLSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    // Crear un objeto NSURL
    NSURL *url = [NSURL URLWithString:@"https://qastusoft.com.es/apis/frase.php"];
    
    // Creamos un objeto de peticionPost con la url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Establecemos el metodo POST
    request.HTTPMethod = @"POST";

    // Establecemos los parametros
    request.HTTPBody = [@"centro=estech" dataUsingEncoding:NSUTF8StringEncoding];
    
    // Crear la tarea
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
          ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
          {
                NSLog(@"Data: %@", data);
                NSLog(@"Response: %@", response);
                NSLog(@"Error: %@", error);

            // Procesar la respuesta json
            NSDictionary<NSString*, NSObject*> * js = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            // Forzamos a ejecutar este codigo en el hilo principal (POrque nos ha dado un errror)
            dispatch_async(dispatch_get_main_queue(),
            ^{
                [self dibujaContenido:js];
            });
          }];
    // Iniciar task
    [task resume];
}

- (void)peticionGet
{
    // Crear un objeto NSURLSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    // Crear un objeto NSURL
    NSString *urlString = @"https://qastusoft.com.es/apis/frase.php?centro=estech";
    NSURL *url = [NSURL URLWithString:urlString];
    
    // Crear un objeto NSURLSessionDataTask con la sesion y la url
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSLog(@"Data: %@", data);
        NSLog(@"Response: %@", response);
        NSLog(@"Error: %@", error);
        
        // Esto contiene lo que ha devuelto pero bien puesto
        NSString * respuesta = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Respuesta: %@", respuesta);
        
        // Procesar respuesta json
        NSDictionary<NSString*, NSObject*> * js = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]; // Lo que hay entre <> son los tipos de datos que se usan en el dictionary la primera parte es de la clave y la otra del valor, hemos puesto NSObject porque dentro habia tanto string como un array
        NSLog(@"JSON: %@", js);
        
        NSString * errorStr = (NSString*)[js objectForKey:@"error"];
        
        if ([errorStr isEqualToString:@""])
        {
            NSLog(@"Centro: %@", (NSString*)[js objectForKey:@"name"]);
            NSLog(@"Direccion: %@", (NSString*)[js objectForKey:@"address"]);
            NSLog(@"Ciudad: %@", (NSString*)[js objectForKey:@"city"]);
            NSLog(@"Imagen url: %@", (NSString*)[js objectForKey:@"image"]);
            
            NSArray * ciclos = (NSArray*)[js objectForKey:@"training"];
            for (id object in ciclos)
            {
                NSLog(@"Ciclo: %@", object);
            }
            // Forzamos a ejecutar este codigo en el hilo principal (POrque nos ha dado un errror)
            dispatch_async(dispatch_get_main_queue(),
            ^{
                [self dibujaContenido:js];
            });
        }
    }];
    // Iniciar task
    [task resume];
}

- (void)dibujaContenido:(NSDictionary<NSString*, NSObject*> *)json
{
    _centroLabel.text =[[NSString alloc]initWithFormat:@"Centro: %@", (NSString*)[json objectForKey:@"name"]];
    
    _ciudadLabel.text =[[NSString alloc]initWithFormat:@"Ciudad: %@", (NSString*)[json objectForKey:@"city"]];
    
    _direccionLabel.text =[[NSString alloc]initWithFormat:@"Dirreccion: %@", (NSString*)[json objectForKey:@"address"]];

    NSString * cursosString = @"Cursos:\n";
    NSArray * ciclos = (NSArray*)[json objectForKey:@"training"];
    for (id ciclo in ciclos)
    {
        cursosString = [NSString stringWithFormat:@"%@%@\n", cursosString, ciclo];
    }
    
    _ciclosLabel.text = cursosString;
    
    NSString * urlImageStr = (NSString *)[json objectForKey:@"image"];
    NSURL * urlImagen = [NSURL URLWithString:urlImageStr];
    NSData * imgData = [[NSData alloc]initWithContentsOfURL:urlImagen];
    
    _imagenLabel.image = [UIImage imageWithData:imgData];
}

@end
