//
//  SegundoViewController.m
//  alertControllerEX
//
//  Created by A1-IMAC08 on 26/10/21.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *saludo = [[NSString alloc] initWithFormat:@"Hola %@", _saludoStirng];
    [_saludo setText:saludo];
    
    
    // standardUserDefaults
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init];
    [userDefaults registerDefaults:@{@"Usuario": @"usuario", @"Contraseña": @"usuario."}];
    

    //NSString *clase = [[NSString alloc] initWithFormat:@"Curso: %@", [userDefaults setObjetc:@"" stringForKey:@""]];
    
}

- (IBAction)logout:(id)sender
{
    // resetStandardUserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:NO forKey:@"logueado"];
    [NSUserDefaults resetStandardUserDefaults];
}


@end
