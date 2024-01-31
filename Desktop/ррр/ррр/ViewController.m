//
//  ViewController.m
//  ррр
//
//  Created by дэвид Кихтенко on 31.07.2023.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.button];
}

- (UIButton *)button {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 150, 100, 50);
    [button setTitle:@"My Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

// Обработчик нажатия на кнопку
- (void)buttonPressed:(UIButton *)sender {
    NSLog(@"Button pressed");
}

    @end
