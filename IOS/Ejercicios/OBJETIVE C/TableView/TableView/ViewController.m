//
//  ViewController.m
//  TableView
//
//  Created by A1-IMAC08 on 29/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myArray = @[@"Chrome",@"firefox"];				
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Tipo de celda (prototipo1) y dentro le ha añadido el texto dinamico
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"prototipo1"];
    
    MiCelda1 * cell = [tableView dequeueReusableCellWithIdentifier:@"prototipo1"];
    
    cell.texto.text = [NSString stringWithFormat:@"Celda %i", indexPath.row];
    return cell;
    
    // esto para coger los datos de un array
    cell.texto.text = _myArray[indexPath.row];
    cell.image.image = [UIImage imageNamed:_myArray[indexPath.row]];
    
    // esto seria un ejemplo de estructura creada en funcion de la celda para añadir una imagen o texto especifico para cada uno
//    switch (indexPath.row)
//    {
//        case 0:
//            cell.texto.text = [NSString stringWithFormat:@"Primera celda"];
//            cell.image.image = [UIImage imageNamed:@"Aqui iria el nombre de la imagen"];
//            break;
//        case 1:
//            cell.texto.text = [NSString stringWithFormat:@"Segunda celda"];
//            cell.image.image = [UIImage imageNamed:@"logo.xbox"];
//            break;
//    }
}

// Esta funcion es para el tamaño de la celda
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 120;
    }else
    {
        return 60;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Seccion %li, Celda %li", (long)indexPath.section, (long)indexPath.row);
}

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
