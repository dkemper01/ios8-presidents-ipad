//
//  DetailViewController.h
//  Presidents
//
//  Created by Station 1 on 5/25/14.
//  Copyright (c) 2014 The Kemper Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
