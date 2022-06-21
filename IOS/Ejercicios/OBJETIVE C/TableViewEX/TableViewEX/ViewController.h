//
//  ViewController.h
//  TableViewEX
//
//  Created by A1-IMAC08 on 4/11/21.
//

#import <UIKit/UIKit.h>
#import "miCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tabla;

@property NSArray *arrayModulo;

@end
