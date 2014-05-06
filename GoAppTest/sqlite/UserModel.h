//
//  UserModel.h
//  GoAppTest
//
//  Created by pengyucheng on 14-2-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "LKDaoBase.h"

@interface UserModelBase :LKDAOBase

@end

@interface UserModel : LKModelBase

@property(strong,nonatomic)NSString *Uid;
@property(strong,nonatomic)NSString *loginName;
@property(strong,nonatomic)NSString *loginPwd;
@property(strong,nonatomic)NSString *userId;
@property(strong,nonatomic)NSString *userEmail;
@property(strong,nonatomic)NSString *emailStatus;
@property(strong,nonatomic)NSString *userTel;
@property(strong,nonatomic)NSString *telStatus;
@property(strong,nonatomic)NSString *nickName;

@end
