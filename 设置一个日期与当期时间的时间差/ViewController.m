//
//  ViewController.m
//  设置一个日期与当期时间的时间差
//
//  Created by aoguoyue on 15/10/14.
//  Copyright (c) 2015年 aoguoyue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // NSArray *array=[self inter]

    //2015-10-15 08:32:14.0
    
    // NSTimeInterval cha = [[NSDate date] timeIntervalSinceDate:];
    //NSLog(@"%f",);
    
   NSDate *date1 = [NSDate dateWithTimeIntervalSince1970: 1448545310];
//    NSLog(@"%@",date1);
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    //使用系统的打印格式
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss.S";
    NSString *str = [df stringFromDate:date1];
    NSLog(@"%@",str);
        NSMutableArray *array = [self intervalSinceNow:str];
        for (id obj in array) {
            NSLog(@"%@",obj);
        }
}
/**
 计算时间的差值
 */
-(NSMutableArray *)intervalSinceNow:(NSString *)theDate
{
   
    //原始传入的时间格式为2015-10-15 08:32:14.0以点分割 放入数组
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    //取点前面的时间 也就是数组的第一个 得到新的theDate
    theDate=[timeArray objectAtIndex:0];
    //NSDateFormatter日期格式类
    NSDateFormatter *dateStyleZDY=[[NSDateFormatter alloc] init];
    //自定义时间的格式
    [dateStyleZDY setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    //把这个字符串转换为dateStyleZDY格式的时间
    NSDate *date=[dateStyleZDY dateFromString:theDate];
    
    
    //直接算出传入的时间与当前时间相差多少秒
    NSTimeInterval cha = [[NSDate date] timeIntervalSinceDate:date];
    int a= (int)cha;
    NSMutableArray * timeArrayList = [NSMutableArray array];
    /*
     published: "1448602493",
     publishtime: "1448607897",
     
     published: "1448602493",
     publishtime: "1448607897",
     
     published: "1448609162",
     publishtime: "1448609475",
     **/
    //计算相差的天时分秒  放入数组
    NSNumber *day = [NSNumber numberWithInt:(a/(3600*24))];
    [timeArrayList addObject:day];
    NSNumber *hour = [NSNumber numberWithInt:(a%(3600*24))/3600];
    [timeArrayList addObject:hour];
    NSNumber *minute = [NSNumber numberWithInt:(a%3600)/60];
    [timeArrayList addObject:minute];
    NSNumber *second = [NSNumber numberWithInt:a%60];
    [timeArrayList addObject:second];
       return timeArrayList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
