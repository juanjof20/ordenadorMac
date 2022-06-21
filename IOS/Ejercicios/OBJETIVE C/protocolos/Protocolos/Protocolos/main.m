//
//  main.m
//  Protocolos
//
//  Created by A1-IMAC08 on 28/9/21.
//

#import <Foundation/Foundation.h>

@protocol MiProtocolo
-(void)methodNecesary;
@optional
-(void)methodOpcional;
-(void)otherMethodOpcional;
@required
-(void)methodRequired;
@end

@interface ClaseEjemplo : NSObject <MiProtocolo>
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
