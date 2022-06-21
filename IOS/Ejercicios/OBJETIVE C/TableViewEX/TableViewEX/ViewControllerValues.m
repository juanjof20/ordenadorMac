//
//  ViewControllerValues.m
//  TableViewEX
//
//  Created by A1-IMAC08 on 18/11/21.
//

#import "ViewControllerValues.h"

@interface ViewControllerValues ()

@end

@implementation ViewControllerValues

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tituloSegunda setText:_titulo];
    [_descripcionSegunda setText:_descri];
    [_imageSegunda setImage:[UIImage imageNamed:_imagenCog]];
       
    NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
}

@end
