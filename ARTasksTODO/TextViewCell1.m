//
//  TextVeiewCell1.m
//  ARTasksTODO
//
//  Created by Corinne Krych on 5/28/13.
//  Copyright (c) 2013 corinne Krych. All rights reserved.
//

#import "TextViewCell1.h"

@implementation TextViewCell1
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];    
    self.txtView.textColor = [UIColor greenColor];
    return self;
}



@end
