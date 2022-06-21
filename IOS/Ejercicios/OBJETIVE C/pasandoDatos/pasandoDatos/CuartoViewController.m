//
//  CuartoViewController.m
//  pasandoDatos
//
//  Created by A1-IMAC08 on 19/10/21.
//

#import "CuartoViewController.h"

@interface CuartoViewController ()

@end

@implementation CuartoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _saludoLabel.text = [[NSString alloc] initWithFormat:@"Hola %@", _nombre];
    
}



@end
