//
//  ViewController.m
//  alertController
//
//  Created by A1-IMAC08 on 22/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)botonPulsado:(id)sender
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Se ha producido un error al pulsar el boton" preferredStyle:UIAlertControllerStyleAlert];//Aqui estamos creando un alert que nos muestra un titulo y un mensaje
    [self presentViewController:alert animated:YES completion:nil]; //Declaracion para que nos muestre el alert

    
    UIAlertAction * accionPorDefecto = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){NSLog(@"Se ha pulsado OK");}];//Aqui estamos creando un alertaction, que cuando pulsamos el boton ok nos muestra un mensaje de que ha sido pulsado por el nslog, esto podemos usarlo para saber si se ha pulsado un boton por ejemplo.
    [alert addAction:accionPorDefecto];

    
    UIAlertAction * accionCancelar = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];//Aqui estamos creando la accion de cancelar para que nos muestre el boton dentro del alert
    [alert addAction:accionCancelar];
    
    
    UIAlertAction * accionDestruct = [UIAlertAction actionWithTitle:@"Destruir" style:UIAlertActionStyleDestructive handler:nil];//Aqui estamos usando la opcion destructive, que es otro tipo de accion para un boton dentro del alert
    [alert addAction:accionDestruct];
}

@end
