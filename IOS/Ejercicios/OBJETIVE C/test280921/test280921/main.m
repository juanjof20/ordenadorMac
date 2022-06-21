//
//  main.m
//  test280921
//
//  Created by A1-IMAC08 on 28/9/21.
//

#import <Foundation/Foundation.h>

struct Books
{
    NSString *title;
    NSString *author;
    NSString *subjet;
    int book_id;
};

@interface SampleClass : NSObject
-(void) printBook:(struct Books) book;
-(void) printBookR:(struct Books *) book;
@end

@implementation SampleClass
-(void) printBook:(struct Books) book
{
    NSLog(@"Titulo del libro: %@", book.title);
    NSLog(@"Autor del libro: %@", book.author);
    NSLog(@"Tematica del librp: %@", book.subjet);
    NSLog(@"Id del libro: %i", book.book_id);
}

-(void) printBookR:(struct Books *) book
{
    NSLog(@"Titulo del libro: %@", book->title);
    NSLog(@"Autor del libro: %@", book->author);
    NSLog(@"Tematica del librp: %@", book->subjet);
    NSLog(@"Id del libro: %i", book->book_id);
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //Declaramos Book1 y Book2de tipo Books
        struct Books Book1;
        struct Books Book2;
        
        //Definimos los valores de Book1
        Book1.title = @"Objetive-C Programming";
        Book1.author = @"Junks";
        Book1.book_id = 782634;
        Book1.subjet = @"Tutorial de programacion Objetive-C";
        
        //Definimos los valores de Book2
        Book2.title = @"Telecom Billing";
        Book2.author = @"Pepito";
        Book2.book_id = 13234;
        Book2.subjet = @"Tutorial de Telecom";
        
        //Imprimir info de Book
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        //Imprimir libro 1
        [sampleClass printBook:Book1];
        
        //Imprimir libro 2
        [sampleClass printBook:Book2];
        
        struct Books *punteroALibro;
        
        punteroALibro = &Book1;
        
        NSLog(@"%@",  punteroALibro->author);
        NSLog(@"%@",  Book1.author);
   
        [sampleClass printBookR:punteroALibro];
        
//        //Imprimir la informacion de Book1
//        NSLog(@"Titulo de Book1: %@", Book1.title);
//        NSLog(@"Autor de Book1: %@", Book1.author);
//        NSLog(@"Tematica de Book1: %@", Book1.subjet);
//        NSLog(@"Id de Book1: %i", Book1.book_id);
//
//        //Imprimir la informacion de Book2
//        NSLog(@"Titulo de Book2: %@", Book2.title);
//        NSLog(@"Autor de Book2: %@", Book2.author);
//        NSLog(@"Tematica de Book2: %@", Book2.subjet);
//        NSLog(@"Id de Book2: %i", Book2.book_id);
        
        
        
        double (^multiplyTwoValues) (double, double) = ^(double firstValue, double secondValue)
        {
            return firstValue * secondValue;
        };
        
        double result;
        result = multiplyTwoValues(2,6);
        NSLog(@"El resultado es %f", result);
        
        return 0;
    }
}
