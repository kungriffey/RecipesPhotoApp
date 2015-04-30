//
//  RecipeCollectionViewController.h
//  RecipePhotoApp
//
//  Created by Kunwardeep Gill on 2015-04-28.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButtonTapped:(UIBarButtonItem *)sender;

@end
