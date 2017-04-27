//
//  HJPlugin001.m
//  H5混编
//
//  Created by jian huang on 2017/4/25.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJPlugin001.h"

@implementation HJPlugin001

- (void)test:(CDVInvokedUrlCommand*)command{
    CDVPluginResult *result1 = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    CDVPluginResult *result2 = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSString *str = command.arguments.firstObject;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你好世界！%@",str] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"成功" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.commandDelegate sendPluginResult:result1 callbackId:command.callbackId];
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"失败" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.commandDelegate sendPluginResult:result2 callbackId:command.callbackId];
    }];
    [alert addAction:action];
    [alert addAction:action1];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    [self.commandDelegate evalJs:@"alert(\"原生调H5\");"];
}


@end
