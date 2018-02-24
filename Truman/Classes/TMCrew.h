//
//  TMCrew.h
//  Pods
//
//  Created by Chipmuck on 2018/2/19.
//

#import <Foundation/Foundation.h>

@interface TMCrew : NSObject

///---------------------
/// @name Initialization
///---------------------

/**
 Create a registered crew in an application and this team is just available in debug mode.
 
 @discussion You should send this message in - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions method.
 
 In debug mode, an instance will be created. In release mode, it will create nothing.
 */
+ (void)takeAction;

@end
