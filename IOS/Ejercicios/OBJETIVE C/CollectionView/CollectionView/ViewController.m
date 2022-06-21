//
//  ViewController.m
//  CollectionView
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// Para decidir la cantidad de celdas
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%d", [personajes count]);
    return [personajes count];
}

// Para decidir el tamaño de la celda
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat ancho = (CGRectGetWidth(_miCollecionView.frame) / 2) - 5; // esto seria la mitad de la pantalla, el - 6 es para darle margen y que no solo aparezca una sola columna.
    return CGSizeMake(ancho, ancho*2); // esto /2 tambien es para que se vea de otro modo, es solo visual para probar diferentes tamaños para las celdas
}

// HEADER
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    Header *header = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        header.titulo.text = [NSString stringWithFormat:@"titulo de la seccion %ld", (long)indexPath.section];
    }
    return header;
}

// Para dibujar las celdas
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // este es el identificador del proto1
    CollectionViewCell * cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"proto1" forIndexPath:indexPath];
    
    // esta es la parte en la que estamos cogiendo las cosas del array que hemos descargado con toda la info para mostrarla
    NSString * nombre = [personajes[indexPath.item] valueForKey:@"character"];
    NSString * frase = [personajes[indexPath.item] valueForKey:@"quote"];
    NSString * imageString = [personajes[indexPath.item] valueForKey:@"image"];
    NSURL * imageUrl = [NSURL URLWithString:imageString];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:imageUrl];
    
    [cell.titulo setText:nombre];
    [cell.frase setText:frase];
    [cell.imagen setImage:[UIImage imageWithData:imageData]];
    return cell;
}

// Cuando una celda es seleccionada
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"Se ha pulsado la celda %ld", (long)indexPath.item);
}

@end
