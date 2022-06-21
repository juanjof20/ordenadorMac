//
//  ViewController.m
//  UiTableViewEXTRA
//
//  Created by A1-IMAC08 on 16/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadData];
}

// Peticion de descarga de datos
- (void)downloadData
{
    // Crear un objeto NSURLSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    // Crear un objeto NSURL
    NSString *urlString = @"https://futuramaapi.herokuapp.com/api/quotes";
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
        NSArray<NSString*> *js = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"JSON: %@", js);
        
        self->_arrayBueno = js;
        NSLog(@"JSONrecuperado %@", js);

        // Forzamos a ejecutar este codigo en el hilo principal (POrque nos ha dado un errror)
        dispatch_async(dispatch_get_main_queue(),
        ^{
            [self->_tablaBuena reloadData];
        });
    }];
    // Iniciar task
    [task resume];
}

// Numero de secciones
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

 // Numero de row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayBueno.count;
}

// Tipo de celda (MiCell) y dentro le ha añadido el texto dinamico
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MiCell"];
    
    MiCelda1 * cell = [tableView dequeueReusableCellWithIdentifier:@"MiCell"];
    
    cell.name.text = _arrayBueno[indexPath.row][@"character"];
    cell.textLong.text = _arrayBueno[indexPath.row][@"quote"];
    NSURL *urlImage = [NSURL URLWithString:_arrayBueno[indexPath.row][@"image"]];
    NSData *imgData = [[NSData alloc] initWithContentsOfURL:urlImage];
    
    cell.image.image = [UIImage imageWithData:imgData];

    return cell;
}

@end
