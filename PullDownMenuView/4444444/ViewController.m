//
//  ViewController.m
//  4444444
//
//  Created by dfpo on 2017/4/23.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "ViewController.h"
#import "IMPullDownMenu.h"

@interface ViewController ()<IMPullDownMenuDelegate>
@property (nonatomic,strong) IMPullDownMenu *pullDownMenu;

/**
 *  用于pullDown Menu
 */

@property (nonatomic,strong) NSString *city;


@property (nonatomic,strong) NSString *year;


@property (nonatomic,strong) NSArray *cityArray;


@property (nonatomic,strong) NSArray *yearsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addView];
}


#pragma -mark ----
- (void)PullDownMenu:(IMPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row
{
    if (column == 0) {
        if (self.cityArray) {
            if (row == 0) {
                self.city = nil;
            }
            else
            {
                if (self.cityArray.count > row - 1) {
                    self.city = [self.cityArray  objectAtIndex:row - 1];
                }
            }
            
            
        }
        
    }
    else if (column == 1)
    {
        if (row == 0) {
//            self.bussinessAreaModel = nil;
        }
        else
        {
//            if ([BaseDataSingleton shareInstance].bizAreas.count > row - 1) {
//                self.bussinessAreaModel = [[BaseDataSingleton shareInstance].bizAreas  objectAtIndex:row - 1];
//            }
        }
        
    }
    else if (column == 2)
    {
        if (row == 0) {
//            self.bussinessTypeModel = nil;
        }
        else
        {
//            if ([BaseDataSingleton shareInstance].bizTypes.count > row - 1) {
//                self.bussinessTypeModel = [[BaseDataSingleton shareInstance].bizTypes  objectAtIndex:row - 1];
//            }
        }
    }
    else if (column == 3)
    {
        if (row == 0) {
            self.year = @"";
        }
        else if(row == 1)
        {
            self.year = @"3";
        }
        else if (row == 2)
        {
            self.year = @"5";
        }
        else if (row == 3)
        {
            self.year = @"10";
        }
        else if (row == 4)
        {
            self.year = @"11";
        }
    }
    
//    [self configData];
}
- (void)addView {
self.pullDownMenu = [[IMPullDownMenu alloc] initWithArray:@[] frame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44) viewController:self];
self.pullDownMenu.backgroundColor = [UIColor whiteColor];
self.pullDownMenu.delegate = self;



//[self.view addSubview:self.tableView];

NSMutableArray *sortArray = [NSMutableArray arrayWithCapacity:0];

NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
NSArray *cityList = [NSArray arrayWithContentsOfFile:plistPath];

NSMutableArray *cityArray = [NSMutableArray array];

for (int i = 0; i < cityList.count; i ++) {
    NSDictionary *dict = (NSDictionary *)[cityList  objectAtIndex:i];
    NSString *city = [dict objectForKey:@"state"];
    [cityArray addObject:city];
}
self.cityArray = [NSArray arrayWithArray:cityArray];

IMPullDownMenuItem *sortItem = [[IMPullDownMenuItem alloc] init];
sortItem.unlimitedBtnText = @"不限";
sortItem.listItemArray =  cityArray;
sortItem.title = @"地区";
IMPullDownMenuItem *sortItem1 = [[IMPullDownMenuItem alloc] init];
sortItem1.unlimitedBtnText = @"不限";
sortItem1.listItemArray = @[@"1-3年",@"3-5年",@"5-10年",@"10年以上",@"1-3年",@"3-5年",@"5-10年",@"10年以上",@"1-3年",@"3-5年",@"5-10年",@"10年以上"];
    //areaTitlesArray;
sortItem1.title = @"领域";
//[sortArray addObject:sortItem1];


IMPullDownMenuItem *sortItem2 = [[IMPullDownMenuItem alloc] init];
//sortItem2.unlimitedBtnText = @"不限";
sortItem2.listItemArray = @[@"1-3年",@"3-5年",@"5-10年",@"10年以上",@"1-3年",@"3-5年",@"5-10年",@"10年以上",@"1-3年",@"3-5年",@"5-10年",@"10年以上"];
    //typeTitlesArray;
sortItem2.title = @"选择城市";
[sortArray addObject:sortItem2];

self.yearsArray = @[@"销量最高", @"距离最近"];

IMPullDownMenuItem *sortItem3 = [[IMPullDownMenuItem alloc] init];
//sortItem3.unlimitedBtnText = @"不限";
sortItem3.listItemArray =  self.yearsArray;
    sortItem3.defaultIndex = 0;
sortItem3.title = @"销量最高";
[sortArray addObject:sortItem3];


[self.pullDownMenu resetDataArray:sortArray];

[self.pullDownMenu addSubview:[self getLineViewWithFrame:CGRectMake(0, self.pullDownMenu.bounds.size.height - .5, [UIScreen mainScreen].bounds.size.width, .5)]];

[self.view addSubview:self.pullDownMenu];

}
-(UIView *)getLineViewWithFrame:(CGRect )rect
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

@end
