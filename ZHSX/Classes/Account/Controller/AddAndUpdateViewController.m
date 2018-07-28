//
//  AddAndUpdateViewController.m
//  ZHSX
//
//  Created by teacher on 16/12/29.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "AddAndUpdateViewController.h"
#import "CarBookDAO.h"
#import "SVProgressHUD.h"
#import "DBUtils.h"

@interface AddAndUpdateViewController ()

/**
 *  以下6个是6个TextField和一个按钮之间的垂直距离 需要根据机型进行动态修改
 *  这个界面是消费日期是垂直居中的 然后上面其他的以它为基准来设置
 *  最下面2个是按钮的宽度和高度
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpace6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidth;




- (IBAction)addAndUpdateBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tf_xmmc;
@property (weak, nonatomic) IBOutlet UITextField *tf_fkfs;
@property (weak, nonatomic) IBOutlet UITextField *tf_xfje;
@property (weak, nonatomic) IBOutlet UITextField *tf_xfrq;
@property (weak, nonatomic) IBOutlet UITextField *tf_gls;
@property (weak, nonatomic) IBOutlet UITextField *tf_bz;


@property (weak, nonatomic) IBOutlet UILabel *label_xmmc;
@property (weak, nonatomic) IBOutlet UILabel *label_fkfs;
@property (weak, nonatomic) IBOutlet UILabel *label_xfje;
@property (weak, nonatomic) IBOutlet UILabel *label_xfrq;
@property (weak, nonatomic) IBOutlet UILabel *label_gls;
@property (weak, nonatomic) IBOutlet UILabel *label_bz;
@property (weak, nonatomic) IBOutlet UIButton *addAndUpdateBtn;


@property(nonatomic, strong) UIDatePicker *datePicker;
@property(nonatomic, strong) CarBookDAO *carBookDAO;

@end

@implementation AddAndUpdateViewController


-(CarBookDAO *)carbookDAO{
    
    if (_carBookDAO == nil) {
        
        _carBookDAO = [[CarBookDAO alloc]init];
    }
    return _carBookDAO;
    
}

-(UIDatePicker *)datePicker{
    
    if (_datePicker == nil) {
        
        self.tf_xfrq.text = [self setDate:[[NSDate alloc]init]];
        
        _datePicker = [[UIDatePicker alloc]init];
        
        _datePicker.datePickerMode = UIDatePickerModeDate;
        
        [_datePicker addTarget:self action:@selector(setXfrq:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return _datePicker;
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setInfo];
    
}


#pragma mark - 动态判断机型修改垂直间距、字体大小
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];


    if (iPhone5_5S_SE) {
        self.verticalSpace1.constant = 40;
        self.verticalSpace2.constant = self.verticalSpace1.constant;
        self.verticalSpace3.constant = self.verticalSpace1.constant;
        self.verticalSpace4.constant = self.verticalSpace1.constant;
        self.verticalSpace5.constant = self.verticalSpace1.constant;
        self.verticalSpace6.constant = self.verticalSpace1.constant;
        self.btnHeight.constant = self.verticalSpace1.constant * 0.75;
        self.btnWidth.constant = self.btnHeight.constant * 3.5;
        
        
        self.tf_xmmc.font = [UIFont systemFontOfSize: 16 * 1.15];
        self.tf_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        
        self.label_xmmc.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.addAndUpdateBtn.titleLabel.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
    }
    else if(iPhone6_6s_7){
        self.verticalSpace1.constant = 50;
        self.verticalSpace2.constant = self.verticalSpace1.constant;
        self.verticalSpace3.constant = self.verticalSpace1.constant;
        self.verticalSpace4.constant = self.verticalSpace1.constant;
        self.verticalSpace5.constant = self.verticalSpace1.constant;
        self.verticalSpace6.constant = self.verticalSpace1.constant;
        self.btnHeight.constant = self.verticalSpace1.constant  * 0.75;
        self.btnWidth.constant = self.btnHeight.constant * 3.5;
        
        self.tf_xmmc.font = [UIFont systemFontOfSize: 16 * 1.35];
        self.tf_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        
        self.label_xmmc.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.addAndUpdateBtn.titleLabel.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];

    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        self.verticalSpace1.constant = 60;
        self.verticalSpace2.constant = self.verticalSpace1.constant;
        self.verticalSpace3.constant = self.verticalSpace1.constant;
        self.verticalSpace4.constant = self.verticalSpace1.constant;
        self.verticalSpace5.constant = self.verticalSpace1.constant;
        self.verticalSpace6.constant = self.verticalSpace1.constant;
        self.btnHeight.constant = self.verticalSpace1.constant * 0.75;
        self.btnWidth.constant = self.btnHeight.constant * 3.5;
        
        self.tf_xmmc.font = [UIFont systemFontOfSize: 16 * 1.55];
        self.tf_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.tf_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        
        self.label_xmmc.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_fkfs.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfje.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_xfrq.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_gls.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.label_bz.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];
        self.addAndUpdateBtn.titleLabel.font = [UIFont systemFontOfSize: self.tf_xmmc.font.pointSize];

    }

}


#pragma mark - 设置一些初始化信息
-(void)setInfo{
    
    //给一个TextField设置弹出的键盘内容
    self.tf_xfrq.inputView = self.datePicker;
    //检查到底是增加还是更新
    if (self.carBook != nil) {
        
        self.title = @"更新";
        self.tf_xmmc.text = self.carBook.xmmc;
        self.tf_fkfs.text = self.carBook.fkfs;
        self.tf_xfje.text = self.carBook.xfje;
        self.tf_xfrq.text = self.carBook.xfrq;
        self.tf_gls.text  = self.carBook.gls;
        self.tf_bz.text = self.carBook.bz;
    }
    
    else{
        self.title = @"增加";
        
    }
    
    [self.addAndUpdateBtn setTitle:self.title forState:UIControlStateNormal];

    
}


#pragma mark - 根据用户选择设置消费日期
-(void)setXfrq:(UIDatePicker *) datePicker{
    
    self.tf_xfrq.text = [self setDate:datePicker.date];
}


#pragma mark - 消费日期格式化操作
-(NSString *)setDate:(NSDate *)xfrq{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //获取用户选择的时间
    NSString *selectedDateStr = [dateFormatter stringFromDate:xfrq];
    
    return selectedDateStr;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 按钮点击事件
- (IBAction)addAndUpdateBtnClick:(id)sender {
    
    CarBook *carbook = [self createCarBookFromInput];
    
    if(carbook != nil){
        
        //如果是更新
        if (self.carBook != nil) {
            //左边的carbook对象是我们根据用户输入或者修改来创建的，由于是自己创建的，没有bookid，但是修改的时候必须要用到bookid，所以需要给该对象赋值bookid；右边是上个界面传过来的carBook，它是有bookid的，所以将它的bookid赋值给左边
            carbook.bookId = self.carBook.bookId;
            
            [self.carbookDAO updateCarBook:carbook];
            
        }
        
        //增加
        else{
            
            [self.carbookDAO addCarBook:carbook];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark - 根据用户输入构造对象
-(CarBook *)createCarBookFromInput{
    
    NSString *xmmc = self.tf_xmmc.text;
    NSString *fkfs = self.tf_fkfs.text;
    NSString *xfje = self.tf_xfje.text;
    NSString *xfrq = self.tf_xfrq.text;
    NSString *gls = self.tf_gls.text;
    NSString *bz = self.tf_bz.text;
    
    [SVProgressHUD dismissWithDelay:0.8];
    
    if ([self isBlankString:xmmc]) {
        [SVProgressHUD showErrorWithStatus:@"项目名称不能为空"];
    }
    else if ([self isBlankString:fkfs]) {
        [SVProgressHUD showErrorWithStatus:@"付款方式不能为空"];
    }
    else if ([self isBlankString:xfje]) {
        [SVProgressHUD showErrorWithStatus:@"消费金额不能为空"];
    }
    else if ([self isBlankString:xfrq]) {
        [SVProgressHUD showErrorWithStatus:@"消费日期不能为空"];
    } else{
        
        CarBook *carBook = [[CarBook alloc]initWithBZ:bz andFkfs:fkfs andGls:gls andXfje:xfje andXmmc:xmmc andXfrq:xfrq];
        return carBook;
    }
    return nil;
}


#pragma mark - 判断字符串是否为空
-(BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        
        return YES;
        
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]== 0) {
        
        return YES;
        
    }
    
    return NO;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
