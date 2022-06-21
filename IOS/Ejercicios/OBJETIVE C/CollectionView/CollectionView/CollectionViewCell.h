//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by A1-IMAC08 on 12/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titulo;

@property (weak, nonatomic) IBOutlet UILabel *frase;


@property (weak, nonatomic) IBOutlet UIImageView *imagen;

@end

NS_ASSUME_NONNULL_END
