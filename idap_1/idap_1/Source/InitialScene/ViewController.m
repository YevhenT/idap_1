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

@property (strong, nonatomic) DataString *dataStrings;

@end

@implementation ViewController


#pragma mark -
#pragma mark Accessors
- (DataString*) dataStrings{
    if(_dataStrings == nil){
        _dataStrings = [DataString new];
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
#pragma mark UITableViewDelegate

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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kCell];
    }
    NSDictionary *dataString = [self.dataStrings objectAtIndex:indexPath.row];
    cell.textLabel.text = (NSString*)dataString[@"firstName"];
    
    return cell;
}

@end
