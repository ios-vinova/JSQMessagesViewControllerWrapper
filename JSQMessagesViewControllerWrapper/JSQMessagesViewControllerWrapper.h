//
//  JSQMessagesViewControllerWrapper.h
//  JSQMessagesViewControllerWrapper
//
//  Created by Vinova on 9/5/17.
//  Copyright © 2017 Vinova. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for JSQMessagesViewControllerWrapper.
FOUNDATION_EXPORT double JSQMessagesViewControllerWrapperVersionNumber;

//! Project version string for JSQMessagesViewControllerWrapper.
FOUNDATION_EXPORT const unsigned char JSQMessagesViewControllerWrapperVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JSQMessagesViewControllerWrapper/PublicHeader.h>

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

#ifndef JSQMessages_JSQMessages_h
#define JSQMessages_JSQMessages_h

#import "JSQMessagesViewController.h"

//  Views
#import "JSQMessagesCollectionView.h"
#import "JSQMessagesCollectionViewCellIncoming.h"
#import "JSQMessagesCollectionViewCellOutgoing.h"
#import "JSQMessagesTypingIndicatorFooterView.h"
#import "JSQMessagesLoadEarlierHeaderView.h"

//  Layout
#import "JSQMessagesBubbleSizeCalculating.h"
#import "JSQMessagesBubblesSizeCalculator.h"
#import "JSQMessagesCollectionViewFlowLayout.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"
#import "JSQMessagesCollectionViewFlowLayoutInvalidationContext.h"
#import "JSQAudioMediaViewAttributes.h"

//  Toolbar
#import "JSQMessagesComposerTextView.h"
#import "JSQMessagesInputToolbar.h"
#import "JSQMessagesToolbarContentView.h"

//  Model
#import "JSQMessage.h"

#import "JSQMediaItem.h"
#import "JSQAudioMediaItem.h"
#import "JSQPhotoMediaItem.h"
#import "JSQLocationMediaItem.h"
#import "JSQVideoMediaItem.h"

#import "JSQMessagesBubbleImage.h"
#import "JSQMessagesAvatarImage.h"

#import "JSQAudioMediaViewAttributes.h"

//  Protocols
#import "JSQMessageData.h"
#import "JSQMessageMediaData.h"
#import "JSQMessageAvatarImageDataSource.h"
#import "JSQMessageBubbleImageDataSource.h"
#import "JSQMessagesCollectionViewDataSource.h"
#import "JSQMessagesCollectionViewDelegateFlowLayout.h"

//  Factories
#import "JSQMessagesAvatarImageFactory.h"
#import "JSQMessagesBubbleImageFactory.h"
#import "JSQMessagesMediaViewBubbleImageMasker.h"
#import "JSQMessagesTimestampFormatter.h"
#import "JSQMessagesToolbarButtonFactory.h"
#import "JSQMessagesMediaPlaceholderView.h"
//  Categories
#import "JSQSystemSoundPlayer+JSQMessages.h"
#import "NSString+JSQMessages.h"
#import "UIColor+JSQMessages.h"
#import "UIImage+JSQMessages.h"
#import "UIView+JSQMessages.h"
#import "NSBundle+JSQMessages.h"

#endif
