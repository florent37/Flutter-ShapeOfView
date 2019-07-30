#import "FlutterShapeOfViewPlugin.h"
#import <flutter_shape_of_view/flutter_shape_of_view-Swift.h>

@implementation FlutterShapeOfViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterShapeOfViewPlugin registerWithRegistrar:registrar];
}
@end
