//
//  UIView+Hierarchy.m

#import "UIView+Hierarchy.h"

@implementation UIView (Hierarchy)

- (NSUInteger)getSubviewIndex {
    return [self.superview.subviews indexOfObject:self];
}

- (void)bringToFront {
    [self.superview bringSubviewToFront:self];
}

- (void)sendToBack
{
    [self.superview sendSubviewToBack:self];
}

- (void)bringOneLevelUp {
    NSUInteger currentIndex = [self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex+1];
}

- (void)sendOneLevelDown {
    NSUInteger currentIndex = [self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

- (BOOL)isInFront {
    return ([self.superview.subviews lastObject]==self);
}

- (BOOL)isAtBack {
    return ([self.superview.subviews objectAtIndex:0]==self);
}

- (void)swapDepthsWithView:(UIView*)swapView {
    [self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}

- (void)removeAllSubviews {
    // Normally.
//    for(UIView *view in [self subviews]) {
//        [view removeFromSuperview];
//    }
    
    // But others.
//    [self setSubviews:[NSArray array]]; // If subviews can be written.
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)removeSubViewByTag:(NSUInteger)tag {
    UIView *v = nil;
    if ((v = [self viewWithTag:tag])) {
        [v removeFromSuperview];
    }
}

- (void)removeSubViews:(NSArray *)views {
    if (views && [views count]) {
        [views makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}

- (BOOL)containsSubView:(UIView *)subView {
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsSubViewOfClassType:(Class)classt {
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:classt]) {
            return YES;
        }
    }
    return NO;
}

-(UIView*)firstSubviewOfClass:(Class)classObj{
    for (UIView* subview in self.subviews) {
        if ([subview isKindOfClass:classObj]) {
            return subview;
        }
    }
    return nil;
}

-(UIViewController*)firstTopViewController{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    for (UIResponder* responder = self.nextResponder; responder != window; responder = responder.nextResponder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
    }
    return nil;
}

@end
