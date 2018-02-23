//
//  ViewController.m
//  idap_1
//
//  Created by Yevhen Triukhan on 21.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "ViewController.h"

#import "DataString.h"

static NSString * kCell = @"Cell";


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id <UITableViewDelegate> tableViewDelegate;
@property (strong, nonatomic) id <UITableViewDataSource> tableViewDataSource;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) DataString *dataStrings;

@end

@implementation ViewController


#pragma mark -
#pragma mark Accessors
- (DataString*) dataStrings{
    //ленивый инит
    if(_dataStrings == nil){
        _dataStrings = [DataString sharedData];
    }
    return _dataStrings;
}



#pragma mark -
#pragma mark View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UIActions

- (IBAction)didPressedEditButton:(UIBarButtonItem*)sender{

    if(self.tableView.editing == NO){
        [self.tableView setEditing:YES animated:YES];
        self.addButton.enabled = NO;
        self.editButton.title = @"Done";
    } else {
        [self.tableView setEditing:NO animated:YES];
        self.addButton.enabled = YES;
        self.editButton.title = @"Edit";
    }
    
}
- (IBAction)didPressedAddButton:(UIBarButtonItem*)sender{
    
}


#pragma mark -
#pragma mark Public API
//overriden
- (IBAction)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:YES animated:YES];
    [self.tableView setEditing:YES animated:YES];
    if(self.tableView.editing){
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    } else {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    }
    
}

#pragma mark -
#pragma mark UITableViewDelegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
#pragma mark -
#pragma mark UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return self.dataStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:kCell];
    }
    NSDictionary *dataString = [self.dataStrings objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", dataString[@"firstName"], dataString[@"lastName"]];
    cell.detailTextLabel.text = dataString[@"birthday"];
    cell.imageView.image = [UIImage imageWithData:(NSData*)dataString[@"imageData"]]; //dataString[@"image"];
    
    return cell;
}

//moving & reordering
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
    
}
//deleting
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}



@end
