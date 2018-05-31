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
#import "ItemDetailViewController.h"

@interface ItemsTableViewController ()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation ItemsTableViewController

- (instancetype)init
{
  // Call the superclass's designated initializer
  self = [super initWithStyle:UITableViewStylePlain];
  return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
  return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (IBAction)addNewItem:(id)sender
{
  GonetItemsStore *store = [GonetItemsStore sharedStore];
  GoNetItem *item = [store createItem];
  NSInteger lastRow = [[store allItems] indexOfObject: item];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
  
  // Insert this new row into the table.
  [self.tableView insertRowsAtIndexPaths:@[indexPath]
                withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{
  if (self.isEditing) {
    [sender setTitle:@"Edit" forState:UIControlStateNormal];
    [self setEditing:NO animated:YES];
  } else {
    [sender setTitle:@"Done" forState:UIControlStateNormal];
    [self setEditing:YES animated:YES];
  }
}

- (UIView *)headerView
{
  if (!_headerView) {
    // Load HeaderView.xib
    [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                  owner:self
                                options:nil];
  }
  return _headerView;
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

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
  [[GonetItemsStore sharedStore] moveItemAtIndex: sourceIndexPath.row toIndex: destinationIndexPath.row];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      NSArray *items = [[GonetItemsStore sharedStore] allItems];
      GoNetItem *item = items[indexPath.row];
      [[GonetItemsStore sharedStore] removeItem: item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  ItemDetailViewController * detailController = [[ItemDetailViewController alloc] init];
  
  //detailController.item = ???
  
  [self.navigationController pushViewController:detailController animated:YES];
}
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
