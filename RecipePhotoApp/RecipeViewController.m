//
//  RecipeViewController.m
//  RecipePhotoApp
//
//  Created by Kunwardeep Gill on 2015-04-30.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController ()

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  self.recipeImageView.image = [UIImage imageNamed:self.recipeImageName];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(UIBarButtonItem *)sender {
}


  
  
  
}





@end
