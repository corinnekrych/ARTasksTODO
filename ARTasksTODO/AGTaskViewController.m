//
//  AGTaskViewController.m
//  ARTasksTODO
//
//  Created by Corinne Krych on 5/27/13.
//  Copyright (c) 2013 corinne Krych. All rights reserved.
//

#import "AGTaskViewController.h"
#import "AGTitleCell.h"
#import "TextViewCell.h"
#import "TextViewCell1.h"
#import "TextViewCell2.h"
// Table Sections
enum AGTableSections {
    AGTableSectionTitle = 0,
    AGTableSectionDescr,
    AGTableSectionDueProjTag,
    AGTableNumSections
};

// Table Rows
enum AGTitleRows {
    AGTableSecTitleRowTitle = 0,
    AGTableSecTitleNumRows,
};

enum AGDescrRows {
    AGTableSecDescrRowDescr = 0,
    AGTableSecDescrNumRows,
};

enum AGDueProjTagRows {
    AGTableSecDueProjTagRowDue = 0,
    AGTableSecDueProjTagRowProj,
    AGTableSecDueProjTagRowTag,
    AGTableSecDueProjTagNumRows
};

@interface AGTaskViewController ()

@end

@implementation AGTaskViewController {

}

@synthesize task = _task;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ARTableViewData *tableViewData = [[ARTableViewData alloc] initWithSectionDataArray:@[[self sectionTitle]]];
    
    // add the section to the tableView
    [tableViewData addSectionData:[self sectionDescription]];
    
    // setting the tableViewData property will automaticaly reload the tableView
    self.tableViewData = tableViewData;
    
}



- (ARSectionData *)sectionTitle {
    // configure the section
    ARSectionData *sectionData = [[ARSectionData alloc] init];
    [self.tableView registerClass:[TextViewCell1 class] forCellReuseIdentifier:NSStringFromClass([TextViewCell1 class])];
    
    // configure the cell
    ARCellData *cellData = [[ARCellData alloc] initWithIdentifier:NSStringFromClass([TextViewCell1 class])];
    [cellData setCellConfigurationBlock:^(TextViewCell1 *cell) {
        // called in cellForRowAtIndexpath
        cell.txtView.text = self.task[@"title"];
    }];
        
        
    [sectionData addCellData:cellData];    
    return sectionData;
}

- (ARSectionData *)sectionDescription {
    // configure the section
    ARSectionData *sectionData = [[ARSectionData alloc] init];
    [self.tableView registerClass:[TextViewCell class] forCellReuseIdentifier:NSStringFromClass([TextViewCell class])];
    
    // configure the cell
    ARCellData *cellData = [[ARCellData alloc] initWithIdentifier:NSStringFromClass([TextViewCell class])];
    [cellData setCellConfigurationBlock:^(TextViewCell *cell) {
        // called in cellForRowAtIndexpath
        cell.txtView.text = self.task[@"description"];
    }];
    
    
    [sectionData addCellData:cellData];
    return sectionData;
}

- (ARSectionData *)sectionDueProjectTag {
    // configure the section
    ARSectionData *sectionData = [[ARSectionData alloc] init];
    [self.tableView registerClass:[TextViewCell class] forCellReuseIdentifier:NSStringFromClass([TextViewCell class])];
    
    // configure the cell
    ARCellData *cellData = [[ARCellData alloc] initWithIdentifier:NSStringFromClass([TextViewCell class])];
    [cellData setCellConfigurationBlock:^(TextViewCell *cell) {
        // called in cellForRowAtIndexpath
        cell.txtView.text = self.task[@"description"];
    }];
    
    [cellData setCellSelectionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
        // called in didSelectRowAtIndexPath
    }];
    
    [sectionData addCellData:cellData];
    return sectionData;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
 	[self.tableView reloadData];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return AGTableNumSections;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    switch (section) {
//        case AGTableSectionTitle:
//            return AGTableSecTitleNumRows;
//        case AGTableSectionDescr:
//            return AGTableSecDescrNumRows;
//        case AGTableSectionDueProjTag:
//            return AGTableSecDueProjTagNumRows;
//        default:
//            return 0;
//    }
//}
//
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    UITableViewCell *cell;
    
    switch (section) {
        case AGTableSectionTitle: {
            //AGTitleCell *titleCell = [[AGTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            AGTitleCell *titleCell = [AGTitleCell cellForTableView:tableView];
            titleCell.txtField.text = self.task[@"title"];
            cell = titleCell;
            break;
        }
        case AGTableSectionDescr:
        {
            TextViewCell *descrCell = [[TextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            //descrCell.txtView.delegate = self;
            
            if (![self.task[@"description"] isKindOfClass:[NSNull class]])
                descrCell.txtView.text = self.task[@"description"];
            
            cell = descrCell;
            break;
        }
        case AGTableSectionDueProjTag:
        {
            switch (row) {
                case AGTableSecDueProjTagRowDue:
                {
                    TextViewCell1 *dateCell = [[TextViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    dateCell.txtView.text =  self.task[@"date"];
                    cell = dateCell;
                    break;
                }
                case AGTableSecDueProjTagRowProj:
                {
                    TextViewCell2 *dateCell = [[TextViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    dateCell.txtView.text  = self.task[@"date"];
                    cell = dateCell;
                    break;
                }
                case AGTableSecDueProjTagRowTag:
                {
                    TextViewCell *dateCell = [[TextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    dateCell.txtView.text = self.task[@"date"];
                        
                    cell = dateCell;
                    break;
                }
            }
            
            break;
        }
        
    }
    
    return cell;
}

*/
@end
