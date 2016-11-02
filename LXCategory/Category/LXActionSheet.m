//
//  LXActionSheet.m
//  YCSchool
//
//  Created by yanglinxia on 16/4/28.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "LXActionSheet.h"

#define LXActionSheetButtonHeight (50) // 其它按钮的高度50
#define LXActionSheetCancelButtonHeight (43) // 取消按钮高度43
#define LXActionSheetCancelButtonMargin (7) // 取消与其它之间的间隙
#define LXActionSheetMargin (1)// 其它按钮的间隙

@interface LXActionSheet()
{
    LXActionSheetCancelAction _cancel;
    LXActionSheetClickedAction _click;
}

///按钮标题
@property (nonatomic,readonly) NSMutableArray *buttonTitles;
///按钮
@property (nonatomic,readonly) NSMutableArray *buttons;

@property (nonatomic,readonly) UIView *contentView;

@property (nonatomic,weak) UIView *parentView;//窗口view

@end

@implementation LXActionSheet

@synthesize buttons = _buttons;
@synthesize buttonTitles = _buttonTitles;

// 添加根据文字数组添加按钮
- (instancetype)initWithCancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitlesArray:(NSArray *)titless
{
    if(self = [super init])
    {
        _buttonTitles = [[NSMutableArray alloc] init];
        _buttons = [[NSMutableArray alloc] init];
        
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor colorWithRed:220/255.0 green:221/ 255.0 blue:221 / 255.0 alpha:1];
        [self addSubview:_contentView];
        if(!cancelButtonTitle)
        {
            cancelButtonTitle = @"取消";
        }
        
        [self.buttonTitles addObject:cancelButtonTitle];
        [self.buttonTitles addObjectsFromArray:titless];
        
        [self.buttonTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:obj forState:UIControlStateNormal];
            [button setTitleColor:(idx == 0 ? [UIColor lightGrayColor] : [UIColor darkGrayColor]) forState:UIControlStateNormal];
            button.backgroundColor = [UIColor whiteColor];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button addTarget:self action:@selector(didTouchUpInsideActionButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
            [self.buttons addObject:button];
        }];
    }
    return self;
}

- (void)dealloc
{
    _click = nil;
    _cancel = nil;
    YCLog(@"LXActionSheet release...");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *objs = [event touchesForView:self];
    if(objs.count > 0)
    {
        [self.buttons.firstObject sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)showInView:(UIView *)view
              mask:(BOOL)mask
             click:(LXActionSheetClickedAction)click
            cancel:(LXActionSheetCancelAction)cancel
{
    if(!self.window)
    {
        _parentView = [UIApplication sharedApplication].keyWindow;
        _cancel = cancel;
        _click = click;
        
        _parentView.userInteractionEnabled = NO;
        
        self.frame =  _parentView.bounds;
        if(mask)
        {
            self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        }
        
        [self loadView];
    }
}

- (void)showInView:(UIView *)view
              mask:(BOOL)mask maskColor:(UIColor *)maskColor
             click:(LXActionSheetClickedAction)click
            cancel:(LXActionSheetCancelAction)cancel
{
    if(!self.window)
    {
        _parentView = [UIApplication sharedApplication].keyWindow;
        _cancel = cancel;
        _click = click;
        
        _parentView.userInteractionEnabled = NO;
        
        self.frame =  _parentView.bounds;
        if(mask)
        {
            if ([maskColor isKindOfClass:[UIColor class]]) {
                self.backgroundColor = maskColor;
            } else {
                self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
            }
        }
        
        [self loadView];
    }


}
- (void)loadView
{
    CGFloat height = (self.buttonTitles.count - 1) * LXActionSheetButtonHeight + (LXActionSheetMargin * (self.buttonTitles.count - 2)) + LXActionSheetCancelButtonMargin + LXActionSheetCancelButtonHeight;
    
    CGRect rect = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
    self.contentView.frame = rect;
    self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0,CGRectGetHeight(rect));// 开始默认下移它的高度，不显示
    
    rect = CGRectMake(0, 0, self.contentView.frame.size.width , LXActionSheetButtonHeight);
    
    for(NSInteger index = self.buttons.count - 1; index >= 0;index --)
    {
        UIButton *button = self.buttons[index];
        button.frame = rect;
        if (index == 1) {
            // 取消
            rect = CGRectMake(0,CGRectGetMaxY(rect)+LXActionSheetCancelButtonMargin,self.frame.size.width,LXActionSheetCancelButtonHeight);
        } else {
            // 其它
            rect = CGRectOffset(rect, 0, CGRectGetHeight(rect) + LXActionSheetMargin);
        }
    }
    
    [self show];
}

- (UIButton *)buttonAtIndex:(NSUInteger)index
{
    if(index < self.buttons.count)
    {
        return self.buttons[index];
    }
    return nil;
}

- (NSString *)currentTitleAtIndex:(NSUInteger)index
{
    UIButton *button = [self buttonAtIndex:index];
    return [button titleForState:UIControlStateNormal];
}

- (void)didTouchUpInsideActionButton:(UIButton *)actionButton
{
    NSUInteger index = [self.buttons indexOfObject:actionButton];
    [self hidden];
    if(index == 0)
    {
        
        if(_cancel) _cancel(index,self);
    }
    else
    {
        if(_click)_click(index,self);
    }
}

- (void)show
{
    [self.parentView addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        self.contentView.alpha = 1.0;
        self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0,-self.contentView.frame.size.height);
    } completion:^(BOOL finished) {
        self.parentView.userInteractionEnabled = YES;
    }];
}

- (void)hidden
{
    [UIView animateWithDuration:0.25 animations:^{
        self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, self.contentView.frame.size.height);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}





@end
