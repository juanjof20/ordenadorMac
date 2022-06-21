//
//  ViewController.h
//  UiTableViewEXTRA
//
//  Created by A1-IMAC08 on 16/11/21.
//

#import <UIKit/UIKit.h>
#import "MiCelda1.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tablaBuena;

@property NSArray *arrayBueno;

- (void)downloadData;

@end
