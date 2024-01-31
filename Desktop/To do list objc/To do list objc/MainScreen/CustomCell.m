//
//  CustomCell.m
//  To do list objc
//
//  Created by дэвид Кихтенко on 31.07.2023.
//

#import "CustomCell.h"

@implementation CustomCell

UILabel *titleLabel;
UILabel *secondLabel;

- (void)_setupUI {
     titleLabel = UILabel.new;
     secondLabel = UILabel.new;
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    titleLabel.text = @"ALLAH";
    [self.contentView addSubview:titleLabel];
    
    secondLabel.translatesAutoresizingMaskIntoConstraints = false;
    secondLabel.text = @"UMER";
    [self.contentView addSubview:secondLabel];
    
    self.contentView.backgroundColor = UIColor.lightGrayColor;
    self.contentView.layer.cornerRadius = 10.0;
}

- (void)_setupLayout {
    [NSLayoutConstraint activateConstraints:@[
        [titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
        [titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8],
        [titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
       
        [secondLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8],
        [secondLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8],
        [secondLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8]
    ]];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _setupUI];
        [self _setupLayout];
    }
    return self;
}
@end
