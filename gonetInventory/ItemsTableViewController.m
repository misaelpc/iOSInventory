//
//  ItemsTableViewController.m
//  gonetInventory
//
//  Created by Misael Pérez Chamorro on 5/30/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "GoNetItem.h"
#import "GonetItemsStore.h"

@interface ItemsTableViewController ()

@end

@implementation ItemsTableViewController

- (instancetype)init
{
  // Call the superclass's designated initializer
  self = [super initWithStyle:UITableViewStylePlain];
  if (self) {
    for (int i = 0; i < 500; i++) {
      [[GonetItemsStore sharedStore] createItem];
    }
  }
  return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
  return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[GonetItemsStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
  [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                forIndexPath:indexPath];

  NSArray *items = [[GonetItemsStore sharedStore] allItems];
  GoNetItem *item = items[indexPath.row];
  
  cell.textLabel.text = item.itemName;
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
