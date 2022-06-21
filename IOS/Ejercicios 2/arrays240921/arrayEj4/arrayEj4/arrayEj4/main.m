//
//  main.m
//  arrayEj4
//
//  Created by A1-IMAC08 on 28/9/21.
//

#import <Foundation/Foundation.h>

@interface RotateArray : NSObject
{
    int x; int aux;
}
-(void) ejecutar;
@end

@implementation RotateArray
-(RotateArray*) init
{
    self = [super init];
    if (self)
    {
        x = 0;
    } return self;
}
-(void)ejecutar
{
    int list[10], a, b = 0;
    for (a = 0; a < 10; a++)
    {
        list[a] = arc4random_uniform(100);
    }
    
    for (x = 0; x <= 10; x++)
    {
        aux = list[a];
        list[a] = b;
        b = aux;
    }
    for (x = 0; x <= 10; x++)
    {
        NSLog(@"%d", list[a]);
    }
    
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        RotateArray * obj = [[RotateArray alloc] init];
        [obj ejecutar];
    }
    return 0;
}
