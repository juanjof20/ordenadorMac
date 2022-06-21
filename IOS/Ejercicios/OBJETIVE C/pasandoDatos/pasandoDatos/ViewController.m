//
//  ViewController.m
//  pasandoDatos
//
//  Created by A1-IMAC08 on 19/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_label setText:@"Nombre de usuario"];
    [_texto setPlaceholder:@"Introduce tu nombre"];
    
    [self.botonSiguiente setTitle:@"Continuar" forState:UIControlStateNormal];
    [_botonSiguiente setTitle:@"Cosa" forState:UIControlStateHighlighted];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pasarSegunda"])
    {
        SegundoViewController *segundoVC = (SegundoViewController *) segue.destinationViewController;
        // o usamos eso de arriba o hay quer usar lo de abajo
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//        SegundoViewController *segundoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"segundoVC"];
//
//        segundoVC.saludo.text = @"Hola Juanjo";
//        //[segundoVC.saludo setText:@"Hola Juanjo"]; //se pueden utilizar ambos
        
        NSString *nombre = _texto.text;
        
        segundoVC.saludoStirng = nombre;
        
//        [self presentViewController:segundoVC animated:YES completion:nil];
        
    }
}

- (IBAction)botonTercero:(id)sender
{
    NSLog(@"Se ha pulsado el boton");
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    CuartoViewController *cuartoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"controller4"];
    
    cuartoVC.nombre = _texto.text;
    
    [self presentViewController:cuartoVC animated:YES completion:nil];
}



@end
