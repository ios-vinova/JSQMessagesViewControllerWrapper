//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesToolbarContentView.h"

#import "UIView+JSQMessages.h"

const CGFloat kJSQMessagesToolbarContentViewHorizontalSpacingDefault    = 8.0f;
const CGFloat kJSQMessagesToolbarContentViewLeftBarWidthDefault         = 32.0f;
const CGFloat kJSQMessagesToolbarContentViewRightBarWidthDefault        = 50.0f;


@interface JSQMessagesToolbarContentView ()

@property (weak, nonatomic) IBOutlet JSQMessagesComposerTextView *textView;

@property (weak, nonatomic) IBOutlet UIView *leftBarButtonContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBarButtonContainerViewWidthConstraint;

@property (weak, nonatomic) IBOutlet UIView *rightBarButtonContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBarButtonContainerViewWidthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftHorizontalSpacingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightHorizontalSpacingConstraint;

// DEPRECATED
@property (weak, nonatomic) IBOutlet UIView *panelContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelContainerViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelContainerViewTopConstaint;

@end

@implementation JSQMessagesToolbarContentView

#pragma mark - Class methods

+ (CGFloat)contentViewHeight {
    return 96.0f; //Including origin content view and action view
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([JSQMessagesToolbarContentView class])
                          bundle:[NSBundle bundleForClass:[JSQMessagesToolbarContentView class]]];
}

#pragma mark - Initialization

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.leftHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.rightHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;

    self.backgroundColor = [UIColor clearColor];
    
    [self setDefaultPanelView];
}

#pragma mark - Setters

- (void)setDefaultPanelView {
    self.panelContainerView.hidden = YES;
    self.panelContainerViewHeightConstraint.constant = 0;
    self.panelContainerViewTopConstaint.constant = 0;
}

- (void)setPanelView:(UIView *)panelView {
    if (_panelView) {
        [_panelView removeFromSuperview];
    }
    
    if (!panelView) {
        _panelView = nil;
        [self setDefaultPanelView];
        return;
    }
    
    if (CGRectEqualToRect(panelView.frame, CGRectZero)) {
        panelView.frame = self.panelContainerView.bounds;
    }
    
    self.panelContainerView.hidden = NO;
    self.panelContainerViewTopConstaint.constant = 6.0f;
    self.panelContainerViewHeightConstraint.constant = 40.0f;
    
    [panelView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.panelContainerView addSubview:panelView];
    [self.panelContainerView jsq_pinAllEdgesOfSubview:panelView];
    [self setNeedsUpdateConstraints];
    
    _panelView = panelView;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    self.leftBarButtonContainerView.backgroundColor = backgroundColor;
    self.rightBarButtonContainerView.backgroundColor = backgroundColor;
}

- (void)setLeftBarButtonItem:(UIButton *)leftBarButtonItem
{
    if (_leftBarButtonItem) {
        [_leftBarButtonItem removeFromSuperview];
    }

    if (!leftBarButtonItem) {
        _leftBarButtonItem = nil;
        self.leftHorizontalSpacingConstraint.constant = 0.0f;
        self.leftBarButtonItemWidth = 0.0f;
        self.leftBarButtonContainerView.hidden = YES;
        return;
    }

    if (CGRectEqualToRect(leftBarButtonItem.frame, CGRectZero)) {
        leftBarButtonItem.frame = self.leftBarButtonContainerView.bounds;
    }

    self.leftBarButtonContainerView.hidden = NO;
    self.leftHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.leftBarButtonItemWidth = CGRectGetWidth(leftBarButtonItem.frame);

    [leftBarButtonItem setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.leftBarButtonContainerView addSubview:leftBarButtonItem];
    [self.leftBarButtonContainerView jsq_pinAllEdgesOfSubview:leftBarButtonItem];
    [self setNeedsUpdateConstraints];

    _leftBarButtonItem = leftBarButtonItem;
}
    
- (void)setLeftBarView:(UIView *)leftBarView {
    if (_leftBarView) {
        [_leftBarView removeFromSuperview];
    }
    
    if (!leftBarView) {
        _leftBarView = nil;
        self.leftHorizontalSpacingConstraint.constant = 0.0f;
        self.leftBarButtonItemWidth = 0.0f;
        self.leftBarButtonContainerView.hidden = YES;
        return;
    }
    
    if (CGRectEqualToRect(leftBarView.frame, CGRectZero)) {
        leftBarView.frame = self.leftBarButtonContainerView.bounds;
    }
    
    self.leftBarButtonContainerView.hidden = NO;
    self.leftHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.leftBarButtonItemWidth = CGRectGetWidth(leftBarView.frame);
    
    [leftBarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.leftBarButtonContainerView addSubview:leftBarView];
    [self.leftBarButtonContainerView jsq_pinAllEdgesOfSubview:leftBarView];
    [self setNeedsUpdateConstraints];
    
    _leftBarButtonItem = NULL;
    _leftBarView = leftBarView;
}
    
- (void)setLeftBarButtonItemWidth:(CGFloat)leftBarButtonItemWidth
{
    self.leftBarButtonContainerViewWidthConstraint.constant = leftBarButtonItemWidth;
    [self setNeedsUpdateConstraints];
}

- (void)setRightBarButtonItem:(UIButton *)rightBarButtonItem
{
    if (_rightBarButtonItem) {
        [_rightBarButtonItem removeFromSuperview];
    }

    if (!rightBarButtonItem) {
        _rightBarButtonItem = nil;
        self.rightHorizontalSpacingConstraint.constant = 0.0f;
        self.rightBarButtonItemWidth = 0.0f;
        self.rightBarButtonContainerView.hidden = YES;
        return;
    }

    if (CGRectEqualToRect(rightBarButtonItem.frame, CGRectZero)) {
        rightBarButtonItem.frame = self.rightBarButtonContainerView.bounds;
    }

    self.rightBarButtonContainerView.hidden = NO;
    self.rightHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.rightBarButtonItemWidth = CGRectGetWidth(rightBarButtonItem.frame);

    [rightBarButtonItem setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.rightBarButtonContainerView addSubview:rightBarButtonItem];
    [self.rightBarButtonContainerView jsq_pinAllEdgesOfSubview:rightBarButtonItem];
    [self setNeedsUpdateConstraints];

    _rightBarButtonItem = rightBarButtonItem;
}
    
- (void)setRightBarView:(UIView *)rightBarView {
    if (_rightBarView) {
        [_rightBarView removeFromSuperview];
    }
    
    if (!rightBarView) {
        _rightBarView = nil;
        self.rightHorizontalSpacingConstraint.constant = 0.0f;
        self.rightBarButtonItemWidth = 0.0f;
        self.rightBarButtonContainerView.hidden = YES;
        return;
    }
    
    if (CGRectEqualToRect(rightBarView.frame, CGRectZero)) {
        rightBarView.frame = self.rightBarButtonContainerView.bounds;
    }
    
    self.rightBarButtonContainerView.hidden = NO;
    self.rightHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.rightBarButtonItemWidth = CGRectGetWidth(rightBarView.frame);
    
    [rightBarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.rightBarButtonContainerView addSubview:rightBarView];
    [self.rightBarButtonContainerView jsq_pinAllEdgesOfSubview:rightBarView];
    [self setNeedsUpdateConstraints];
    
    _rightBarButtonItem = NULL;
    _rightBarView = rightBarView;
}

- (void)setRightBarButtonItemWidth:(CGFloat)rightBarButtonItemWidth
{
    self.rightBarButtonContainerViewWidthConstraint.constant = rightBarButtonItemWidth;
    [self setNeedsUpdateConstraints];
}

- (void)setRightContentPadding:(CGFloat)rightContentPadding
{
    self.rightHorizontalSpacingConstraint.constant = rightContentPadding;
    [self setNeedsUpdateConstraints];
}

- (void)setLeftContentPadding:(CGFloat)leftContentPadding
{
    self.leftHorizontalSpacingConstraint.constant = leftContentPadding;
    [self setNeedsUpdateConstraints];
}

#pragma mark - Getters

- (CGFloat)leftBarButtonItemWidth
{
    return self.leftBarButtonContainerViewWidthConstraint.constant;
}

- (CGFloat)rightBarButtonItemWidth
{
    return self.rightBarButtonContainerViewWidthConstraint.constant;
}

- (CGFloat)rightContentPadding
{
    return self.rightHorizontalSpacingConstraint.constant;
}

- (CGFloat)leftContentPadding
{
    return self.leftHorizontalSpacingConstraint.constant;
}

#pragma mark - UIView overrides

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    [self.textView setNeedsDisplay];
}

#pragma mark - Hooking
    
-(CGFloat)fullLeftViewWidth {
    CGFloat numberOfItems   = 3; // Camera / Library / Hide Button
    CGFloat totalItemsWidth = numberOfItems * kJSQMessagesToolbarContentViewLeftBarWidthDefault;
    return totalItemsWidth;
}
    
-(CGFloat)defaultLeftViewWidth {
    CGFloat result = kJSQMessagesToolbarContentViewLeftBarWidthDefault;
    return result;
}
    
-(CGFloat)fullRightViewWidth {
    CGFloat result = self.frame.size.width - [self defaultLeftViewWidth] - kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
        
    NSLog(@"=> fullRightViewWidth result: %lf", result);
    return result;
}
    
-(CGFloat)defaultRightViewWidth {
    CGFloat result = kJSQMessagesToolbarContentViewRightBarWidthDefault;
    
    NSLog(@"=> defaultRightViewWidth result: %lf", result);
    return result;
}
    
-(void)showDefaultLeftView {
    [self setLeftBarButtonItemWidth: [self defaultLeftViewWidth]];
}

-(void)showFullLeftView {
    [self setLeftBarButtonItemWidth: [self fullLeftViewWidth]];
}
    
-(void)showDefaultRightView {
    [self setRightBarButtonItemWidth:[self defaultRightViewWidth]];
}
    
-(void)showFullRightView {
    [self setRightBarButtonItemWidth:[self fullRightViewWidth]];
}
    
@end




