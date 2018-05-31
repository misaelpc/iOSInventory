//
//  ItemDetailViewController.m
//  gonetInventory
//
//  Created by Misael Pérez Chamorro on 5/31/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "GoNetItem.h"

@interface ItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *serialTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  _nameTextField.text = _item.itemName;
    // Do any additional setup after loading the view from its nib.
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

@end
