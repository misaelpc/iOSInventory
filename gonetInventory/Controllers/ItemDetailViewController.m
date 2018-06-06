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
  _serialTextField.text = _item.serialNumber;
  _valueTextField.text = [[NSString alloc]
                          initWithFormat: @"%d", _item.valueInDollars];
  _dateLabel.text = [self formatDate: _item.dateCreated];
  // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated{
  [super viewWillDisappear:animated];
  _item.itemName = _nameTextField.text;
  _item.serialNumber = _serialTextField.text;
  _item.valueInDollars = [_valueTextField.text intValue];
}

- (void)setItem:(GoNetItem *)item {
  _item = item;
  self.navigationItem.title = _item.itemName;
}

- (NSString *) formatDate:(NSDate *) date {
  static NSDateFormatter *dateFormatter;
  if (!dateFormatter) {
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
  }
  return [dateFormatter stringFromDate:date];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonWasTouchedUpInside:(id)sender {
  //[self.navigationController popToRootViewControllerAnimated:YES];
  [self dismissViewControllerAnimated:YES completion:nil];
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
