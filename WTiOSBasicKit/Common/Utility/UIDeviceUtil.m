//
//  DeviceName.m
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import "UIDeviceUtil.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDeviceUtil
+ (NSString*)hardwareString {
  int name[] = {CTL_HW,HW_MACHINE};
  size_t size = 100;
  sysctl(name, 2, NULL, &size, NULL, 0); // getting size of answer
  char *hw_machine = malloc(size);

  sysctl(name, 2, hw_machine, &size, NULL, 0);
  NSString *hardware = [NSString stringWithUTF8String:hw_machine];
  free(hw_machine);
  return hardware;
}

/* This is another way of gtting the system info
 * For this you have to #import <sys/utsname.h>
 */

/*
 NSString* machineName
 {
 struct utsname systemInfo;
 uname(&systemInfo);
 return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
 }
 */

+ (Hardware)hardware {
  NSString *hardware = [self hardwareString];
  if ([hardware isEqualToString:@"iPhone1,1"])    return IPHONE_2G;
  if ([hardware isEqualToString:@"iPhone1,2"])    return IPHONE_3G;
  if ([hardware isEqualToString:@"iPhone2,1"])    return IPHONE_3GS;
  if ([hardware isEqualToString:@"iPhone3,1"])    return IPHONE_4;
  if ([hardware isEqualToString:@"iPhone3,2"])    return IPHONE_4;
  if ([hardware isEqualToString:@"iPhone3,3"])    return IPHONE_4_CDMA;
  if ([hardware isEqualToString:@"iPhone4,1"])    return IPHONE_4S;
  if ([hardware isEqualToString:@"iPhone5,1"])    return IPHONE_5;
  if ([hardware isEqualToString:@"iPhone5,2"])    return IPHONE_5_CDMA_GSM;
  if ([hardware isEqualToString:@"iPhone5,3"])    return IPHONE_5C;
  if ([hardware isEqualToString:@"iPhone5,4"])    return IPHONE_5C_CDMA_GSM;
  if ([hardware isEqualToString:@"iPhone6,1"])    return IPHONE_5S;
  if ([hardware isEqualToString:@"iPhone6,2"])    return IPHONE_5S_CDMA_GSM;

  if ([hardware isEqualToString:@"iPhone7,1"])    return IPHONE_6_PLUS;
  if ([hardware isEqualToString:@"iPhone7,2"])    return IPHONE_6;

  if ([hardware isEqualToString:@"iPod1,1"])      return IPOD_TOUCH_1G;
  if ([hardware isEqualToString:@"iPod2,1"])      return IPOD_TOUCH_2G;
  if ([hardware isEqualToString:@"iPod3,1"])      return IPOD_TOUCH_3G;
  if ([hardware isEqualToString:@"iPod4,1"])      return IPOD_TOUCH_4G;
  if ([hardware isEqualToString:@"iPod5,1"])      return IPOD_TOUCH_5G;

  if ([hardware isEqualToString:@"iPad1,1"])      return IPAD;
  if ([hardware isEqualToString:@"iPad1,2"])      return IPAD_3G;
  if ([hardware isEqualToString:@"iPad2,1"])      return IPAD_2_WIFI;
  if ([hardware isEqualToString:@"iPad2,2"])      return IPAD_2;
  if ([hardware isEqualToString:@"iPad2,3"])      return IPAD_2_CDMA;
  if ([hardware isEqualToString:@"iPad2,4"])      return IPAD_2;
  if ([hardware isEqualToString:@"iPad2,5"])      return IPAD_MINI_WIFI;
  if ([hardware isEqualToString:@"iPad2,6"])      return IPAD_MINI;
  if ([hardware isEqualToString:@"iPad2,7"])      return IPAD_MINI_WIFI_CDMA;
  if ([hardware isEqualToString:@"iPad3,1"])      return IPAD_3_WIFI;
  if ([hardware isEqualToString:@"iPad3,2"])      return IPAD_3_WIFI_CDMA;
  if ([hardware isEqualToString:@"iPad3,3"])      return IPAD_3;
  if ([hardware isEqualToString:@"iPad3,4"])      return IPAD_4_WIFI;
  if ([hardware isEqualToString:@"iPad3,5"])      return IPAD_4;
  if ([hardware isEqualToString:@"iPad3,6"])      return IPAD_4_GSM_CDMA;
  if ([hardware isEqualToString:@"iPad4,1"])      return IPAD_AIR_WIFI;
  if ([hardware isEqualToString:@"iPad4,2"])      return IPAD_AIR_WIFI_GSM;
  if ([hardware isEqualToString:@"iPad4,3"])      return IPAD_AIR_WIFI_CDMA;
  if ([hardware isEqualToString:@"iPad4,4"])      return IPAD_MINI_RETINA_WIFI;
  if ([hardware isEqualToString:@"iPad4,5"])      return IPAD_MINI_RETINA_WIFI_CDMA;
  if ([hardware isEqualToString:@"iPad4,6"])      return IPAD_MINI_RETINA_WIFI_CELLULAR_CN;
  if ([hardware isEqualToString:@"iPad4,7"])      return IPAD_MINI_3_WIFI;
  if ([hardware isEqualToString:@"iPad4,8"])      return IPAD_MINI_3_WIFI_CELLULAR;
  if ([hardware isEqualToString:@"iPad5,3"])      return IPAD_AIR_2_WIFI;
  if ([hardware isEqualToString:@"iPad5,4"])      return IPAD_AIR_2_WIFI_CELLULAR;
  if ([hardware isEqualToString:@"i386"])         return SIMULATOR;
  if ([hardware isEqualToString:@"x86_64"])       return SIMULATOR;
  if ([hardware hasPrefix:@"iPhone"])             return SIMULATOR;
  if ([hardware hasPrefix:@"iPod"])               return SIMULATOR;
  if ([hardware hasPrefix:@"iPad"])               return SIMULATOR;

  //log message that your device is not present in the list
  [self logMessage:hardware];

  return NOT_AVAILABLE;
}

+ (NSString*)hardwareDescription {
  NSString *hardware = [self hardwareString];
  if ([hardware isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
  if ([hardware isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
  if ([hardware isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
  if ([hardware isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
  if ([hardware isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev. A)";
  if ([hardware isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
  if ([hardware isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
  if ([hardware isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
  if ([hardware isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
  if ([hardware isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
  if ([hardware isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (Global)";
  if ([hardware isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
  if ([hardware isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";

  if ([hardware isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
  if ([hardware isEqualToString:@"iPhone7,2"])    return @"iPhone 6";

  if ([hardware isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
  if ([hardware isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
  if ([hardware isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
  if ([hardware isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
  if ([hardware isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";

  if ([hardware isEqualToString:@"iPad1,1"])      return @"iPad (WiFi)";
  if ([hardware isEqualToString:@"iPad1,2"])      return @"iPad 3G";
  if ([hardware isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
  if ([hardware isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
  if ([hardware isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
  if ([hardware isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi Rev. A)";
  if ([hardware isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
  if ([hardware isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
  if ([hardware isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
  if ([hardware isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
  if ([hardware isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
  if ([hardware isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
  if ([hardware isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
  if ([hardware isEqualToString:@"iPad3,5"])      return @"iPad 4 (CDMA)";
  if ([hardware isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
  if ([hardware isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
  if ([hardware isEqualToString:@"iPad4,2"])      return @"iPad Air (WiFi+GSM)";
  if ([hardware isEqualToString:@"iPad4,3"])      return @"iPad Air (WiFi+CDMA)";
  if ([hardware isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
  if ([hardware isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (WiFi+CDMA)";
  if ([hardware isEqualToString:@"iPad4,6"])      return @"iPad Mini Retina (Wi-Fi + Cellular CN)";
  if ([hardware isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (Wi-Fi)";
  if ([hardware isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Wi-Fi + Cellular)";
  if ([hardware isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
  if ([hardware isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Wi-Fi + Cellular)";

  if ([hardware isEqualToString:@"i386"])         return @"Simulator";
  if ([hardware isEqualToString:@"x86_64"])       return @"Simulator";
  if ([hardware hasPrefix:@"iPhone"])             return @"iPhone";
  if ([hardware hasPrefix:@"iPod"])               return @"iPod";
  if ([hardware hasPrefix:@"iPad"])               return @"iPad";

  //log message that your device is not present in the list
  [self logMessage:hardware];

  return nil;
}

+ (NSString*)hardwareSimpleDescription {
  NSString *hardware = [self hardwareString];
  if ([hardware isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
  if ([hardware isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
  if ([hardware isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
  if ([hardware isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
  if ([hardware isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
  if ([hardware isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
  if ([hardware isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
  if ([hardware isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
  if ([hardware isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
  if ([hardware isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
  if ([hardware isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
  if ([hardware isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
  if ([hardware isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
  if ([hardware isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
  if ([hardware isEqualToString:@"iPhone7,2"])    return @"iPhone 6";

  if ([hardware isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
  if ([hardware isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
  if ([hardware isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
  if ([hardware isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
  if ([hardware isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";

  if ([hardware isEqualToString:@"iPad1,1"])      return @"iPad";
  if ([hardware isEqualToString:@"iPad1,2"])      return @"iPad";
  if ([hardware isEqualToString:@"iPad2,1"])      return @"iPad 2";
  if ([hardware isEqualToString:@"iPad2,2"])      return @"iPad 2";
  if ([hardware isEqualToString:@"iPad2,3"])      return @"iPad 2";
  if ([hardware isEqualToString:@"iPad2,4"])      return @"iPad 2";
  if ([hardware isEqualToString:@"iPad2,5"])      return @"iPad Mini";
  if ([hardware isEqualToString:@"iPad2,6"])      return @"iPad Mini";
  if ([hardware isEqualToString:@"iPad2,7"])      return @"iPad Mini";
  if ([hardware isEqualToString:@"iPad3,1"])      return @"iPad 3";
  if ([hardware isEqualToString:@"iPad3,2"])      return @"iPad 3";
  if ([hardware isEqualToString:@"iPad3,3"])      return @"iPad 3";
  if ([hardware isEqualToString:@"iPad3,4"])      return @"iPad 4";
  if ([hardware isEqualToString:@"iPad3,5"])      return @"iPad 4";
  if ([hardware isEqualToString:@"iPad3,6"])      return @"iPad 4";
  if ([hardware isEqualToString:@"iPad4,1"])      return @"iPad Air";
  if ([hardware isEqualToString:@"iPad4,2"])      return @"iPad Air";
  if ([hardware isEqualToString:@"iPad4,3"])      return @"iPad Air";
  if ([hardware isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina";
  if ([hardware isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina";
  if ([hardware isEqualToString:@"iPad4,6"])      return @"iPad Mini Retina CN";
  if ([hardware isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
  if ([hardware isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
  if ([hardware isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
  if ([hardware isEqualToString:@"iPad5,4"])      return @"iPad Air 2";

  if ([hardware isEqualToString:@"i386"])         return @"Simulator";
  if ([hardware isEqualToString:@"x86_64"])       return @"Simulator";
  if ([hardware hasPrefix:@"iPhone"])             return @"iPhone";
  if ([hardware hasPrefix:@"iPod"])               return @"iPod";
  if ([hardware hasPrefix:@"iPad"])               return @"iPad";

  //log message that your device is not present in the list
  [self logMessage:hardware];

  return nil;
}

+ (float)hardwareNumber:(Hardware)hardware {
  switch (hardware) {
    case IPHONE_2G:                         return 1.1f;
    case IPHONE_3G:                         return 1.2f;
    case IPHONE_3GS:                        return 2.1f;
    case IPHONE_4:                          return 3.1f;
    case IPHONE_4_CDMA:                     return 3.3f;
    case IPHONE_4S:                         return 4.1f;
    case IPHONE_5:                          return 5.1f;
    case IPHONE_5_CDMA_GSM:                 return 5.2f;
    case IPHONE_5C:                         return 5.3f;
    case IPHONE_5C_CDMA_GSM:                return 5.4f;
    case IPHONE_5S:                         return 6.1f;
    case IPHONE_5S_CDMA_GSM:                return 6.2f;
    case IPHONE_6_PLUS:                     return 7.1f;
    case IPHONE_6:                          return 7.2f;

    case IPOD_TOUCH_1G:                     return 1.1f;
    case IPOD_TOUCH_2G:                     return 2.1f;
    case IPOD_TOUCH_3G:                     return 3.1f;
    case IPOD_TOUCH_4G:                     return 4.1f;
    case IPOD_TOUCH_5G:                     return 5.1f;

    case IPAD:                              return 1.1f;
    case IPAD_3G:                           return 1.2f;
    case IPAD_2_WIFI:                       return 2.1f;
    case IPAD_2:                            return 2.2f;
    case IPAD_2_CDMA:                       return 2.3f;
    case IPAD_MINI_WIFI:                    return 2.5f;
    case IPAD_MINI:                         return 2.6f;
    case IPAD_MINI_WIFI_CDMA:               return 2.7f;
    case IPAD_3_WIFI:                       return 3.1f;
    case IPAD_3_WIFI_CDMA:                  return 3.2f;
    case IPAD_3:                            return 3.3f;
    case IPAD_4_WIFI:                       return 3.4f;
    case IPAD_4:                            return 3.5f;
    case IPAD_4_GSM_CDMA:                   return 3.6f;

    case IPAD_AIR_WIFI:                     return 4.1f;
    case IPAD_AIR_WIFI_GSM:                 return 4.2f;
    case IPAD_AIR_WIFI_CDMA:                return 4.3f;
    case IPAD_AIR_2_WIFI:                   return 5.3f;
    case IPAD_AIR_2_WIFI_CELLULAR:          return 5.4f;

    case IPAD_MINI_RETINA_WIFI:             return 4.4f;
    case IPAD_MINI_RETINA_WIFI_CDMA:        return 4.5f;
    case IPAD_MINI_3_WIFI:                  return 4.6f;
    case IPAD_MINI_3_WIFI_CELLULAR:         return 4.7f;
    case IPAD_MINI_RETINA_WIFI_CELLULAR_CN: return 4.8f;


    case SIMULATOR:                         return 100.0f;
    case NOT_AVAILABLE:                     return 200.0f;
  }
  return 200.0f; //Device is not available
}

+ (CGSize)backCameraStillImageResolutionInPixels {
  switch ([self hardware]) {
    case IPHONE_2G:
    case IPHONE_3G:
      return CGSizeMake(1600, 1200);
      break;
    case IPHONE_3GS:
      return CGSizeMake(2048, 1536);
      break;
    case IPHONE_4:
    case IPHONE_4_CDMA:
    case IPAD_3_WIFI:
    case IPAD_3_WIFI_CDMA:
    case IPAD_3:
    case IPAD_4_WIFI:
    case IPAD_4:
    case IPAD_4_GSM_CDMA:
      return CGSizeMake(2592, 1936);
      break;
    case IPHONE_4S:
    case IPHONE_5:
    case IPHONE_5_CDMA_GSM:
    case IPHONE_5C:
    case IPHONE_5C_CDMA_GSM:
    case IPHONE_6:
    case IPHONE_6_PLUS:
      return CGSizeMake(3264, 2448);
      break;

    case IPOD_TOUCH_4G:
      return CGSizeMake(960, 720);
      break;
    case IPOD_TOUCH_5G:
      return CGSizeMake(2440, 1605);
      break;

    case IPAD_2_WIFI:
    case IPAD_2:
    case IPAD_2_CDMA:
      return CGSizeMake(872, 720);
      break;

    case IPAD_MINI_WIFI:
    case IPAD_MINI:
    case IPAD_MINI_WIFI_CDMA:
      return CGSizeMake(1820, 1304);
      break;
    
    case IPAD_AIR_2_WIFI:
    case IPAD_AIR_2_WIFI_CELLULAR:
        return CGSizeMake (1536, 2048);
        break;
          
    default:
      NSLog(@"We have no resolution for your device's camera listed in this category. Please, make photo with back camera of your device, get its resolution in pixels (via Preview Cmd+I for example) and add a comment to this repository (https://github.com/InderKumarRathore/UIDeviceUtil) on GitHub.com in format Device = Hpx x Wpx.");
      NSLog(@"Your device is: %@", [self hardwareDescription]);
      break;
  }
  return CGSizeZero;
}

+ (void)logMessage:(NSString *)hardware {
  NSLog(@"This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/UIDeviceUtil and add a comment there.");
  NSLog(@"Your device hardware string is: %@", hardware);
}

+ (void)adaptPhone4s:(Block)phone4sBlock phone5s:(Block)phone5sBlock phone6:(Block)phone6Block phone6p:(Block)phone6pBlock {
    
    if ([UIDeviceUtil hardware]==IPHONE_4||[UIDeviceUtil hardware]==IPHONE_4_CDMA||[UIDeviceUtil hardware]==IPHONE_4S) {
        
        if (phone4sBlock) {
            phone4sBlock();
        }
        
    }else if ([UIDeviceUtil hardware]==IPHONE_5||[UIDeviceUtil hardware]==IPHONE_5_CDMA_GSM||[UIDeviceUtil hardware]==IPHONE_5C||[UIDeviceUtil hardware]==IPHONE_5C_CDMA_GSM||[UIDeviceUtil hardware]==IPHONE_5S||[UIDeviceUtil hardware]==IPHONE_5S_CDMA_GSM){
        
        if (phone5sBlock) {
            phone5sBlock();
        }
        
    }else if ([UIDeviceUtil hardware]==IPHONE_6){
        
        if (phone6Block) {
            phone6Block();
        }
        
    }else if ([UIDeviceUtil hardware]==IPHONE_6_PLUS){
    
        if (phone6pBlock) {
            phone6pBlock();
        }
    }
}

+ (void)adapterPad1024:(Block)pad1024Block pad2048:(Block)pad2048Block {
    NSUInteger hardwareDevice = [UIDeviceUtil hardware];
    
    switch (hardwareDevice) {
        case IPAD_MINI:
        case IPAD_MINI_WIFI:
        case IPAD_MINI_3_WIFI:
        case IPAD_MINI_WIFI_CDMA:
        case IPAD_MINI_3_WIFI_CELLULAR:
            
        case IPAD:
        case IPAD_2:
        case IPAD_2_CDMA:
        case IPAD_2_WIFI: {
            if (pad1024Block) {
                pad1024Block();
            }
        }
            break;
            
        case IPAD_MINI_RETINA_WIFI:
        case IPAD_MINI_RETINA_WIFI_CDMA:
        case IPAD_MINI_RETINA_WIFI_CELLULAR_CN:
            
        case IPAD_3_WIFI_CDMA:
        case IPAD_3G:
        case IPAD_3_WIFI:
        case IPAD_4:
        case IPAD_4_GSM_CDMA:
        case IPAD_4_WIFI:
        case IPAD_AIR_2_WIFI:
        case IPAD_AIR_2_WIFI_CELLULAR:
        case IPAD_AIR_WIFI:
        case IPAD_AIR_WIFI_CDMA:
        case IPAD_AIR_WIFI_GSM:
        case IPAD_3: {
            if (pad2048Block) {
                pad2048Block();
            }
        }
            break;
            
        default: {
            if (pad2048Block) {
                pad2048Block();
            }
        }
            break;
    }
}

@end
