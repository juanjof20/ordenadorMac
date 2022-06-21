//
//  ViewController.h
//  peticionesAPIS
//
//  Created by A1-IMAC08 on 5/11/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagenLabel;

@property (weak, nonatomic) IBOutlet UILabel *centroLabel;

@property (weak, nonatomic) IBOutlet UILabel *direccionLabel;

@property (weak, nonatomic) IBOutlet UILabel *ciudadLabel;

@property (weak, nonatomic) IBOutlet UILabel *ciclosLabel;

- (void)peticionGet;

- (void)peticionPost;

- (void)dibujaContenido:(NSDictionary<NSString*, NSObject*> *)json;

@end

