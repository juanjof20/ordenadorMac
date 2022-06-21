//
//  ViewController.m
//  alertControllerEX
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
    
    [_userTxt setPlaceholder:@"Introduce tu nombre"];
    [_passTxt setPlaceholder:@"Introduce tu contraseña"];
}

- (IBAction)soyAlumno:(id)sender
{
    //Creando alert
    UIAlertController * soyDe = [UIAlertController alertControllerWithTitle:@"Seleccione su curso" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:soyDe animated:YES completion:nil];
    
    //Opcion DAM
    UIAlertAction * classDAM = [UIAlertAction actionWithTitle:@"DAM" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                {
                                    [self -> _soyAlumnoButton setTitle:@"Soy Alumno de DAM" forState:UIControlStateNormal];
                                }];
    [soyDe addAction:classDAM];
    
    //Opcion VJ
    UIAlertAction * classVJ = [UIAlertAction actionWithTitle:@"VJ" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                               {
                                   [self -> _soyAlumnoButton setTitle:@"Soy Alumno de VJ" forState:UIControlStateNormal];
                               }];
    [soyDe addAction:classVJ];
}

- (IBAction)Login:(id)sender
{
    //Comprobar si los campos estan vacios para mostar alert de error
    if ([_passTxt.text isEqualToString:@""] || [_userTxt.text isEqualToString:@""])
    {
        //Creando alertEmpty
        UIAlertController * alertEmpty = [UIAlertController alertControllerWithTitle:@"ERROR!!" message:@"Los campos no pueden estar vacios" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertEmpty animated:YES completion:nil];
        
        //Boton OK
        UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertEmpty addAction:ok];
    }else
    {
        //Comprobar si los campos tienen menos de 6 caracteres
        if (_userTxt.text.length < 6 || _passTxt.text.length < 6)
        {
            //Creando alertSize
            UIAlertController * alertSize = [UIAlertController alertControllerWithTitle:@"ERROR!!" message:@"Los campos no pueden contener menos de 6 caracteres" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertSize animated:YES completion:nil];
            
            //Boton OK
            UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertSize addAction:ok];
        }else
        {
            //Comprobar si la contraseña es correcta
            if (![_passTxt.text isEqualToString:[_userTxt.text stringByAppendingString:@"."]])
            {
                //Creando alertPass
                UIAlertController * alertPass = [UIAlertController alertControllerWithTitle:@"Contraseña Incorrecta" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alertPass animated:YES completion:nil];
                
                //Boton OK
                UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertPass addAction:ok];
            }
            //standardUserDefault
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setBool:YES forKey:@"logueado"];
        }
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    // standardUserDefault
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Stroyboard
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    SegundoViewController *newViewController = [mainSB instantiateViewControllerWithIdentifier:@"segundoVC"];
   
    // FullScreen
    newViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    // Aqui estoty mandando storyboard
    [self presentViewController:newViewController animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pasarSegunda"])
    {
        //Creacion del nuevo viewController
        SegundoViewController *segundoVC = (SegundoViewController *) segue.destinationViewController;
        
        //Definir nombre
        NSString *nombre = _userTxt.text;
        segundoVC.saludoStirng = nombre;
        
        [NSUserDefaults resetStandardUserDefaults];

    }
}

@end
