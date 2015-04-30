//
//  RecipeViewController.h
//  RecipePhotoApp
//
//  Created by Kunwardeep Gill on 2015-04-30.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;

- (IBAction)close:(UIBarButtonItem *)sender;

@property (weak, nonatomic) NSString *recipeImageName;


@end
