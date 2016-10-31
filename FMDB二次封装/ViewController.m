//
//  ViewController.m
//  FMDB二次封装
//
//  Created by cz on 16/10/31.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseManager.h"

#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)增加
{
    /*
     创建表后会自动打印数据存放路径
     */
    
    for(int i = 0; i < 5; i++)
    {
        Student *student = [[Student alloc] init];
        student.name = [NSString stringWithFormat:@"学生%d", i];
        [[DatabaseManager databaseManager] insertObjectToDatabaseWithObejct:student];
    }
    
    //单个添加
    Student *stu = [[Student alloc] init];
    stu.name = @"学生6";
    
    BOOL isSuccess = [[DatabaseManager databaseManager] insertObjectToDatabaseWithObejct:stu];
    NSLog(@"%@", isSuccess ? @"添加成功" : @"添加失败");
}

- (void)根据条件查询
{
    
    NSArray *arr = [[DatabaseManager databaseManager] queryObjectsFromDatabaseWithTableName:@"Student" condition:@{@"name":@"学生1"}];
    
    for(Student *stu in arr)
    {
        NSLog(@"%@", stu.name);
    }
    
}

- (void)查询整个表
{
    
    NSArray *arr = [[DatabaseManager databaseManager] queryAllObjectsFromDatabaseWithTableName:@"Student"];
    
    for(Student *stu in arr)
    {
        NSLog(@"%@", stu.name);
    }

}



- (void)根据条件删除
{
    BOOL isSuccess = [[DatabaseManager databaseManager] deleteObjectsFromDatabaseWithTableName:@"Student" condition:@{@"name":@"学生1"}];
    
    NSLog(@"%@", isSuccess ? @"条件删除成功" : @"条件删除失败");
    
}

- (void)删除整个表
{
    BOOL isSuccess = [[DatabaseManager databaseManager] deleteAllObjectsFromDatabaseWithTableName:@"Student"];
    
    NSLog(@"%@", isSuccess ? @"表删除成功" : @"表删除失败");
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [self 增加];
    NSLog(@"***********************************************************");
    [self 查询整个表];
    NSLog(@"***********************************************************");
    [self 根据条件查询];
    NSLog(@"***********************************************************");
    [self 根据条件删除];
    NSLog(@"***********************************************************");
    [self 删除整个表];
    
    
    
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
