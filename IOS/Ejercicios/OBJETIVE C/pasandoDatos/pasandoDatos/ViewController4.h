//
//  ViewController4.h
//  pasandoDatos
//
//  Created by A1-IMAC08 on 21/10/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ViewController4;
@protocol ViewController4Delegate <NSObject>

-(void) devuelveTexto:(ViewController4 *)controller pasaleElTexto:(NSString *)item;

@end

@interface ViewController4 : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *saludo;
@property NSString *fraseString;

@property (nonatomic, weak) id <ViewController4Delegate>delegate;
@end

NS_ASSUME_NONNULL_END
