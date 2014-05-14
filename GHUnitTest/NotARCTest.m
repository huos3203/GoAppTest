//
//  NotARCTest.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//
#import <GHUnitIOS/GHUnit.h>
#import "Address.h"
#import "Person.h"

#import "Car.h"
#import "Engine.h"
#import "Tire.h"

@interface NotARCTest : GHTestCase

@end

@implementation NotARCTest

-(void)testARC
{
    NSString *city = [[NSString alloc] initWithString:@"Beijing"];
    //initWithString 是NSString的使用NSString字面值初始化的方法，与下面直接使用C语言字符序列初始化相比，@“”支持Unicode字符集。
    NSString *street = [[NSString alloc] initWithCString:"Jinsongzhongjie" encoding:NSUTF8StringEncoding];
    //initWithCString 是NSString 的一个使用C语言的字符序列初始化的方法。
    Address *address = [[Address alloc]init];
    [address setCity:city andStreet:street];
    
    [city release];
    [street release];
    [address release];
}

-(void)testPool
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
    for(int i=0;i<1000000;i++){
        NSString *s=@"...";
        if(i%1000==0){
            [pool release];
            pool=[[NSAutoreleasePool alloc] init];
        }
    }
}

//string
-(void)testNSString
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    NSString *s1=[NSString stringWithFormat: @"You height is %d weight is %d!",168,68];
    NSLog(s1);
    
    //长度
    NSLog(@"The str length is %d !",[s1 length]);
    
    NSString *s2 = @"You Height is 168 Weight is 68 !";
    //比较
    if ([s2 isEqualToString:s1] == YES) {
        NSLog(@"Equal YES");
    }else{
        NSLog(@"Equal NO");
    }
    
    //详细比较
    NSComparisonResult cr = [s2 compare:s1 options:NSCaseInsensitiveSearch|NSNumericSearch];
    if (cr == NSOrderedSame) {
        NSLog(@"Compare YES");
    }else{
        NSLog(@"Compare NO");
    }
    
    //判断前缀
    if ([s1 hasPrefix:@"The"]) {
        NSLog(@"hasPrefix YES");
    }else{
        NSLog(@"hasPrefix NO");
    }
    
    NSRange range=[s1 rangeOfString: @"height"];
    if(!(range.location==NSNotFound)){
        NSLog(@"The \"height\" is located in %u!",range.location);
        NSLog(@"The \"height\" length is %u!",range.length);
    }
    [pool release];
    
    NSMutableString *ms1=[NSMutableString stringWithCapacity: 100];
    [ms1 appendString: @"You height is "];
    [ms1 appendFormat: @"%d weight is %d!", 168, 68];
    NSLog(@"%@",ms1);
    
    NSRange range1=[ms1 rangeOfString: @" weight is 68"];
    [ms1 deleteCharactersInRange: range1];
    NSLog(@"%@",ms1);
}

//NSArray 不能存储基本数据类型，enum ，struct，nil，只能存储Object-C对象
-(void)testNSArray
{
    NSArray *array=[NSArray arrayWithObjects: @"One", @"Two", @"Three", nil];
    int count = [array count]; //
    for (int i = 0; i < count; i++) {
        NSLog(@"%@",[array objectAtIndex:i]);
    }
    NSString *s=@"iPhone,Android,Windows Phone 7";
    array = [s componentsSeparatedByString:@","]; //按照一个字符串将字符串拆分为数组
    s = [array componentsJoinedByString:@" "]; //按照一个字符串将数组链接为字符串
    
    NSMutableArray *mArray=[NSMutableArray arrayWithCapacity: 10];
    [mArray addObject: @"Apple"];//添加数组元素
    [mArray addObject: @"Google"];
    [mArray addObject: @"MicroSoft"];
    [mArray removeObjectAtIndex: 2]; //移除指定索引上得数组元素
    s=[mArray componentsJoinedByString: @","];//拼接数组元素为字符串
    NSLog(s);
    
    NSEnumerator *e = [mArray objectEnumerator];
    //获取数组的迭代器，相当于Java中得Iterator,reserveObjectEnumerator用于获取反转之后的数组迭代器。与Java一致的地方是在使用迭代器时，不能对数组进行添加，删除
    id obj;
    while (obj = [e nextObject]) {
        NSLog(@"%@",obj);
    }
    
    //for - each 快速枚举为Object-c
    for (NSString *ms in mArray) {
        NSLog(@"%@",ms);
    }
    
    
}

//哈希表
-(void)testNSDictionary
{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys: @"Apple", @"A", @"Google", @"G", nil];
    //dictionaryWithObjectAndKeys后的可变参数，每两个为一个value-key,以nil表示结束
    NSLog(@"%@",[dic objectForKey: @"A"]); // 按照指定的key查询Value
    
    NSMutableDictionary *mDic=[NSMutableDictionary dictionaryWithCapacity: 10];
    [mDic setObject: @"Apple" forKey: @"A"];//添加 value-key 对
    [mDic setObject: @"Google" forKey: @"G"];
    [mDic setObject: @"Windows Phone 7" forKey: @"W"];
    [mDic removeObjectForKey: @"W"];//移除指定 key 的 value
    /*快速迭代的for-each 循环
     for(id key in mDic){
     NSLog(@"%@ : %@",key,[mDic objectForKey: key]);
     } */
    NSEnumerator *keyEnum = [mDic keyEnumerator]; //获得key的枚举器
    id  key1;
    while (key1 = [keyEnum nextObject]) {
        NSLog(@"%@:%@",key1,[mDic objectForKey:key1]);
    }
    
}

//Object-C 对象比较问题，需要实现从NSObject继承而来的两个方法:
// - (BOOL) isEqual: (id) anObject;     - (NSUInteger) hash;
-(void)testNSSet
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Person *person1=[[Person alloc] init];
    [person1 setPid: 1];
    [person1 setName: @"Name1"];
    Person *person2=[[Person alloc] init];
    [person2 setPid: 1];
    [person2 setName: @"Name1"];
    Person *person3=[[Person alloc] init];
    [person3 setPid: 3];
    [person3 setName: @"Name3"];
    NSSet *set=[NSSet setWithObjects: person1, person2, person3, nil];
    NSEnumerator *e=[set objectEnumerator];
    Person *person;
    while(person=[e nextObject]){
        NSLog(@"%d",[person pid]);
    }

    [pool release];
}

//封装类
-(void)testNSValue
{
//    NSRect rect=[[NSRect alloc] init];
//    rect = NSMakeRect(1,2,30,50);//矩形结构体
    
    //valueWithBytes要求传入包装数据的地址，也就是变量中存储的数据的首地址，使用C语言的&zz作为地址运算符，计算指针存储的首地址
    //ObjCType要求传入用于描述数据的类型，大小的字符串，使用@encode指令包装数据所属的类型
//    NSValue *v=[NSValue valueWithBytes: &rect objCType: @encode(NSRect)];
//    
//    NSMutableArray *mArray=[NSMutableArray arrayWithCapacity: 3];
//    [mArray addObject: v];
//    NSRect rect2;
//    [[mArray objectAtIndex: 0] getValue: &rect2];
    //NSValue的-(void)getValue:(void)value 方法可以将NSValue中得数据内容取出，要求传入的参数是一个指针，也就是说getValue方法将你传入的指针指向存储的数据
    //一般Cocoa中的getXXX方法都是这个作用，这也是为什么前面的getter方法不要以get作为方法前缀的原因
//    printf("%f\n",rect2.size.width);
    
    NSNumber *n1=[NSNumber numberWithChar: 'A'];
    NSNumber *n2=[NSNumber numberWithInt: 100];
    NSNumber *n3=[NSNumber numberWithFloat: 99.9F];
    NSNumber *n5=[NSNumber numberWithBool: YES];
    printf("%d\n",[n2 intValue]);
}

-(void)testNsDate
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //获取当前时间
    NSDate *today = [NSDate date];
    NSLog(@"Today is %@!",today);
    
    //格式化一个指定的字符串为日期类型
//    NSCalendar *date2=[NSCalendar dateWithString:@"26 Apr 2008"
//                                          calendarFormat:@"%d %b %Y"];
//    NSLog(@"Today is %@!",date2);
    
    //获取当前时间的前一天的时间
    NSDate *date3=[NSDate dateWithTimeIntervalSinceNow: -24*60*60];
    NSLog(@"Yestoday is %@!",date3);
    
    [pool release];

}

-(void)testNSData
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    const char *cs="He is very heigh!";
    //c语言的字符序列。它的指针地址，即是数组的首地址，故不用加&计算指针的地址。
    NSData *data=[NSData dataWithBytes:cs length:strlen(cs)+1 ];
    //第一个参数指定要缓存的数据的起始位置，也就是指针里存储的首地址，第二参数指定缓存数据的长度
    //长度加1是C语言的特性，c语言中的字符串以\0结尾
    
    NSLog(@"%@",data);
    [pool release];
}

//NSArray,NSDictionary,NSString,NSdata持久化的成员方法
-(void)testWriteToFile
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *array=[NSArray arrayWithObjects: @"Apple", @"Google" , @"Microsoft" ,nil];
    [array writeToFile: @"plist.txt" atomically: NO];
    //将数组写入到一个文件，atomically：YES,表示文件先存储到临时文件区如果文件保存成功，再替换掉原始文件，好处是防止保存过程中出错，仅适小文件
    
    NSArray *array2=[NSArray arrayWithContentsOfFile: @"plist.txt"];
    //将文件还原成对象，问题是，即便加载文件失败也不会报异常，仅是返回nil
    NSLog(@"%@",[array2 objectAtIndex: 1]);
    [pool release];
}

//使用NSCoding协议，序列化，反序列化
-(void)testCoder
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Person *person=[Person new];
    [person setName: @"张三"];
    [person setPid: 1];
    [person setHeight: 185.5];
    //归档对象
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject: person];
    [data writeToFile: @"person.db" atomically: NO];
    [person release];
    
    //还原数据为对象
    Person *person2=[NSKeyedUnarchiver unarchiveObjectWithData: data];
    NSLog(@"%@",[person2 name]);
    
    [pool release];
}

//使用NSCopying
-(void)testCopy
{
    Engine *engine=[Engine new];
    Tire *tire=[[Tire alloc] initWithCount: 4];
    Car *car=[Car new];
    [car setEngine: engine];
    [car setTire: tire];
    [engine release];
    [tire release];
    Car *newCar=[car copy];//复制 car 对象
    [car release];
//至此，原有的对象car已经被内存回收，如果下面的代码能正常运行，说明复制操作成功
    printf("The car has %d tires!",
    [[newCar tire] count]);
    [newCar release];
}
@end
