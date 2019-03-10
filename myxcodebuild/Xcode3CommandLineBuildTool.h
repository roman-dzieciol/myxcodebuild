#pragma once

#import <Foundation/Foundation.h>

@interface Xcode3CommandLineBuildTool : NSObject

@property long long exitStatus;
@property (copy) NSString * name;
@property (copy) NSArray * arguments;
@property (copy) NSDictionary * environment;
@property (retain) NSFileHandle * standardInput;
@property (retain) NSFileHandle * standardOutput;
@property (retain) NSFileHandle * standardError;

+ (id)sharedCommandLineBuildTool;
- (void)run;

@end
