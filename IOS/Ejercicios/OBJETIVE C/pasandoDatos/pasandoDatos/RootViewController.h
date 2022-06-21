//
//  RootViewController.h
//  pasandoDatos
//
//  Created by A1-IMAC08 on 21/10/21.
//

#import <UIKit/UIKit.h>
#import "ViewController4.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController <ViewController4Delegate>

@property (weak, nonatomic) IBOutlet UITextField *texto;
@property (weak, nonatomic) IBOutlet UIButton *boton;

@end

NS_ASSUME_NONNULL_END
