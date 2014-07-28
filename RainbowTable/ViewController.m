//
//  ViewController.m
//  RainbowTable
//
//  Created by Iván Mervich on 7/28/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *colorTableView;

@property NSMutableArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor redColor],
                   [UIColor orangeColor],
                   [UIColor yellowColor],
                   [UIColor greenColor],
                   [UIColor blueColor],
                   [UIColor purpleColor],
                   [UIColor magentaColor],
                   nil];
}

- (IBAction)onAddRandomColor:(id)sender
{
    float red = (float) rand()/RAND_MAX;
    float green = (float) rand()/RAND_MAX;
    float blue = (float) rand()/RAND_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];

    [self.colors addObject:color];
    [self.colorTableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"somethingUsefulID"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];;

    return  cell;
}

@end