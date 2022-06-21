//
//  ViewControllerValues.h
//  TableViewEX
//
//  Created by A1-IMAC08 on 18/11/21.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerValues : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageSegunda;

@property (weak, nonatomic) IBOutlet UILabel *tituloSegunda;

@property (weak, nonatomic) IBOutlet UILabel *descripcionSegunda;

@property NSString *titulo;
@property NSString *descri;
@property NSString *imagenCog;
@property NSString *cantCeldas;

@end

NS_ASSUME_NONNULL_END
