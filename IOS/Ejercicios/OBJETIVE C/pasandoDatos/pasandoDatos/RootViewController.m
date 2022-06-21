//
//  RootViewController.m
//  pasandoDatos
//
//  Created by A1-IMAC08 on 21/10/21.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (IBAction)botonPulsado:(id)sender
{
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    ViewController4 *newViewController = [mainSB instantiateViewControllerWithIdentifier:@"controller5"];
    
    newViewController.fraseString = _texto.text;
    newViewController.delegate = self;
    
    [[self navigationController] pushViewController:newViewController animated:YES];
}

- (void) devuelveTexto:(ViewController4 *)controller pasaleElTexto:(NSString *)item
{
    NSLog(@"Esto viene del otro controllador: %@", item);
}

@end
