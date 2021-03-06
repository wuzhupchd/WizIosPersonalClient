//
//  NSArray+WizTools.m
//  Wiz
//
//  Created by 朝 董 on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSArray+WizTools.h"
#import "WizAttachment.h"
@implementation NSMutableArray (WizTools)
- (BOOL) hasWizObject:(WizObject *)obj
{
    for (WizObject* each in self) {
        if ([each.guid isEqualToString:obj.guid]) {
            return YES;
        }
    }
    return  NO;
}

- (void) addObjectUnique:(id)object
{
    for (id each in self) {
        if ([object isEqual:each]) {
            return;
        }
    }
    [self addObject:object];
}
- (void) addWizObjectUnique:(WizObject*)objcet
{
    for (WizObject* each in self) {
        if ([each.guid isEqualToString:objcet.guid]) {
            return;
        }
    }
    [self addObject:objcet];
}
- (void) addAttachmentUnique:(WizAttachment*)attachment
{
    for (WizAttachment* each in self) {
        if ([each.description isEqualToString:attachment.description]) {
            return;
        }
    }
    [self addObject:attachment];
}
- (void) addAttachmentBySourceFile:(NSString *)source
{
    WizAttachment* attachm = [[WizAttachment alloc] init];
    attachm.title = [source fileName];
    attachm.description = source;
    attachm.localChanged = WizAttachmentEditTypeTempChanged;
    [self addAttachmentUnique:attachm];
    [attachm release];
}
- (NSArray*) attachmentTempSourceFile
{
    NSMutableArray* arr = [NSMutableArray array];
    for (WizAttachment* each in self) {
        if (WizAttachmentEditTypeTempChanged == each.localChanged) {
            [arr addObject:each.description];
        }
    }
    return arr;
}
@end
