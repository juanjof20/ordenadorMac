//
//  ViewController.m
//  UICOllectionViewEX
//
//  Created by A1-IMAC08 on 12/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadData];
}

// Descarga de datos
- (void)downloadData
{
    personajes = [[NSArray alloc] init];
    NSString *urlString = @"https://futuramaapi.herokuapp.com/api/quotes";
    
    NSError * error;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    NSString * json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(json)
    {
        if([json isKindOfClass:[NSArray class]])
        {
            personajes = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        }
    }
}

// Para decidir la cantidad de celdas
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu", [personajes count]);
    return [personajes count];
}

// Para decidir el tamaño de la celda
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat ancho = (CGRectGetWidth(_miCollectionView.frame) / 2) - 5;
    return CGSizeMake(ancho, ancho*2);
}

// Para dibujar las celdas
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // este es el identificador del proto1
    CollectionViewCell * cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"proto1" forIndexPath:indexPath];
    
    // esta es la parte en la que estamos cogiendo las cosas del array que hemos descargado con toda la info para mostrarla
    NSString * nombre = [personajes[indexPath.item] valueForKey:@"character"];
    //NSString * frase = [personajes[indexPath.item] valueForKey:@"quote"];
    NSString * imageString = [personajes[indexPath.item] valueForKey:@"image"];
    NSURL * imageUrl = [NSURL URLWithString:imageString];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:imageUrl];
    
    [cell.titulo setText:nombre];
    //[cell.frase setText:frase]; // Hay que declararlo en ViewController.h
    [cell.imagen setImage:[UIImage imageWithData:imageData]];
    return cell;
}

// Cuando una celda es seleccionada y muestra el alert
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:personajes[indexPath.item][@"character"] message:personajes[indexPath.item][@"quote"] preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertAction * accionPorDefecto = [UIAlertAction actionWithTitle:@"Volver a lista" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:accionPorDefecto];
}

@end
