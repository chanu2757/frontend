//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<bs_flutter_buttons/BsFlutterButtonsPlugin.h>)
#import <bs_flutter_buttons/BsFlutterButtonsPlugin.h>
#else
@import bs_flutter_buttons;
#endif

#if __has_include(<bs_flutter_responsive/BsFlutterResponsivePlugin.h>)
#import <bs_flutter_responsive/BsFlutterResponsivePlugin.h>
#else
@import bs_flutter_responsive;
#endif

#if __has_include(<bs_flutter_utils/BsFlutterUtilsPlugin.h>)
#import <bs_flutter_utils/BsFlutterUtilsPlugin.h>
#else
@import bs_flutter_utils;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<package_info_plus/FLTPackageInfoPlusPlugin.h>)
#import <package_info_plus/FLTPackageInfoPlusPlugin.h>
#else
@import package_info_plus;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BsFlutterButtonsPlugin registerWithRegistrar:[registry registrarForPlugin:@"BsFlutterButtonsPlugin"]];
  [BsFlutterResponsivePlugin registerWithRegistrar:[registry registrarForPlugin:@"BsFlutterResponsivePlugin"]];
  [BsFlutterUtilsPlugin registerWithRegistrar:[registry registrarForPlugin:@"BsFlutterUtilsPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTPackageInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlusPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
