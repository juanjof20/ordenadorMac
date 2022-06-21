//
//  ViewController.h
//  TableView
//
//  Created by A1-IMAC08 on 29/10/21.
//

#import <UIKit/UIKit.h>
#import "MiCelda1.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray * myArray;

@end

NS_ASSUME_NONNULL_END
