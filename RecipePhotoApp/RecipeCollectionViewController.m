//
//  RecipeCollectionViewController.m
//  RecipePhotoApp
//
//  Created by Kunwardeep Gill on 2015-04-28.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "RecipeCollectionViewCell.h"
#import "RecipeCollectionHeaderView.h"
#import "RecipeViewController.h"

#import <Social/Social.h>


@interface RecipeCollectionViewController ()

@end

@implementation RecipeCollectionViewController
{
  NSArray *recipeImages;
  NSArray *mainDishesImages;
  NSArray *drinkDessertImages;
  NSMutableArray *selectedRecipes;
  BOOL sharedEnabled;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
  
    mainDishesImages = @[@"egg_benedict.jpg", @"full_breakfast.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg"];
  
    drinkDessertImages = @[@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"green_tea.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg"];
  
    recipeImages = @[mainDishesImages, drinkDessertImages];
  
  
    //  Add Sectional Spacing
  UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
  collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
  
  selectedRecipes = [NSMutableArray array];
  
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [recipeImages count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[recipeImages objectAtIndex:section]count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCollectionViewCell *cell = (RecipeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
  cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame"]];
  cell.recipeImageView.image = [UIImage imageNamed:[recipeImages[indexPath.section] objectAtIndex:indexPath.row]];
  cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame-selected"]];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  
  UICollectionReusableView *reusableView = nil;
  
  if (kind == UICollectionElementKindSectionHeader) {
    
    RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    
    NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%i",indexPath.section + 1];
    headerView.titleLabel.text = title;
    reusableView = headerView;
  }
  
  if (kind == UICollectionElementKindSectionFooter) {
    UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
    reusableView = footerView;
  }
  
  return reusableView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"showRecipePhoto"]) {
    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
    UINavigationController *destinationViewController = segue.destinationViewController;
    RecipeViewController *recipeViewController = (RecipeViewController *)[destinationViewController.childViewControllers firstObject];
    NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
    recipeViewController.recipeImageName = [recipeImages[indexPath.section]objectAtIndex:indexPath.row];
    [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
  }
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  
  if (sharedEnabled) {
    //determine selected items
    NSString *selectedRecipe = [recipeImages [indexPath.section]
                                objectAtIndex:indexPath.row];
    //Add into array
    [selectedRecipes addObject:selectedRecipe];
  }
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
  if (sharedEnabled) {
    NSString *deSelectedRecipe = [recipeImages[indexPath.section]
                                  objectAtIndex:indexPath.row];
    [selectedRecipes removeObject:deSelectedRecipe];
  }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
  if(sharedEnabled) {
    return NO;
  } else {
    return YES;
  }
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (IBAction)shareButtonTapped:(UIBarButtonItem *)sender {
  if (sharedEnabled) {
    // Post selected photos to Facebook
    if ([selectedRecipes count] > 0) {
      if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
      {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [controller setInitialText:@"Check out my recipes!"];
        for (NSString *recipePhoto in selectedRecipes) {
          [controller addImage:[UIImage imageNamed:recipePhoto]];
        }
        [self presentViewController:controller animated:YES completion:nil];
      }
    }
    
    // Deselect all selected items
    for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems)
    {
      [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    
    // Remove all items from selectedRecipes array
    [selectedRecipes removeAllObjects];
    
    // shareEnable to NO and keep button title Share
    sharedEnabled = NO;
    self.collectionView.allowsMultipleSelection = NO;
    self.shareButton.title = @"Share";
    [self.shareButton setStyle:UIBarButtonItemStylePlain];
    }
  else
    {
    
      //  shareEnable to yes and change button text to upload
      sharedEnabled = YES;
      self.collectionView.allowsMultipleSelection = YES;
      self.shareButton.title = @"Upload";
      [self.shareButton setStyle:UIBarButtonItemStyleDone];
    }

  
  
  
}
@end
