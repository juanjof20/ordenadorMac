//
//  ViewController.h
//  CollectionView
//
//  Created by A1-IMAC08 on 12/11/21.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "Header.h"

NSArray * personajes;

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *miCollecionView;

@end
