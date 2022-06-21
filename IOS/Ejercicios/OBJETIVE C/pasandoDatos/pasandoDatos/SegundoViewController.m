//
//  SegundoViewController.m
//  pasandoDatos
//
//  Created by A1-IMAC08 on 19/10/21.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [_saludo setText:@"Hola"];
//    [_atras setTitle:@"Atras" forState:UIControlStateNormal];
    
    NSString *saludo = [[NSString alloc] initWithFormat:@"Hola %@", _saludoStirng];
    [_saludo setText:saludo];
    
}



@end
