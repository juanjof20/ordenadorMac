//
//  ViewController4.m
//  pasandoDatos
//
//  Created by A1-IMAC08 on 21/10/21.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _saludo.text = _fraseString;
    
    NSString *mensaje = @"mensaje de controller 5";
    [self.delegate devuelveTexto:self pasaleElTexto:mensaje];
    
    
}


@end
