//
//  Post_activity_postsVC.m
//  TestWalker
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 Long. All rights reserved.
//

#import "Post_activity_postsVC.h"

@interface Post_activity_postsVC ()<UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITextView *_input_view;
    UIImageView *_img;
    UIView *_footComment;
}
@end

@implementation Post_activity_postsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"活动贴";
    _img = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50,100, 100)];
    [_img setCenter:CGPointMake(100, 100+14*2)];
    
    _input_view = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _input_view.returnKeyType = UIReturnKeyDone;
	
    [_input_view setDelegate:self];
    [self.view addSubview:_input_view];
    //发帖 底部工具条
    _footComment = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-44.0f, self.view.bounds.size.width, 44.0f)];
    UIImageView *_background_footComment = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44.0f)];
    [_background_footComment setImage:[UIImage imageNamed:@"toolbar_bottom_bar.png"]];
    [_footComment addSubview:_background_footComment];
    [self.view addSubview:_footComment];
    //
    UIButton *_btn_face = [[UIButton alloc]initWithFrame:CGRectMake(222, 3, 34, 34)];
    [_btn_face setBackgroundImage:[UIImage imageNamed:@"chat_bottom_smile_nor.png"] forState:UIControlStateNormal];
    [_btn_face addTarget:self action:@selector(getImg:) forControlEvents:UIControlEventTouchUpInside];
    [_footComment addSubview:_btn_face];
    //chat_bottom_up_nor.png
    UIButton *_btn_up = [[UIButton alloc]initWithFrame:CGRectMake(264, 3, 34, 34)];
    [_btn_up setBackgroundImage:[UIImage imageNamed:@"chat_bottom_up_nor.png"] forState:UIControlStateNormal];
    [_footComment addSubview:_btn_up];
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextView代理
//判断输入如果是回车键则退出键盘,首输入的字符
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        //retrun NO 是不进行回车换行
        return NO;
    }
    return YES;
}
//当文字改变的逻辑
- (void)textViewDidChange:(UITextView *)textView{
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:textView.text];
    textView.attributedText = attrStr;
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    CGSize size = [_input_view.text sizeWithAttributes:dic];
    int length = size.height;
    int colomNumber = _input_view.contentSize.height/length;
    NSLog(@"%d",colomNumber);
    CGFloat origion_img_y = _img.center.y;
    if (colomNumber>0) {
        [UIView animateWithDuration:0.8f animations:^{
            [_img setCenter:CGPointMake(100, 100+length*colomNumber)];
        }];
    }  if(colomNumber == 43 && origion_img_y == 100+14*2){
        [_img setCenter:CGPointMake(100, 100+length*2)];
    }
    
}
- (void)viewWillAppear:(BOOL)animated
{
    //创建通知 键盘即将出现和关闭
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.tabBarController.tabBar.hidden = YES;

      [super viewWillAppear:YES];
}
#pragma mark  - 键盘即将显示和退出
- (void)keyBoardWillShow:(NSNotification *)note{
    
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        [_input_view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-rect.size.height-44.0f)];
        [_footComment setCenter:CGPointMake(rect.size.width/2, self.view.bounds.size.height - rect.size.height-44/2)];
    }];
}
- (void)keyBoardWillHide:(NSNotification *)note{
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        //你改变过一个view.transform属性或者view.layer.transform的时候需要恢复默认状态的话，记得先把他们重置可以使用
        [_footComment setFrame:CGRectMake(0, self.view.bounds.size.height-44.0f, self.view.bounds.size.width, 44.0f)];
        [_input_view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    }];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
-(void)getImg:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择一张图片吧" delegate:self  cancelButtonTitle:@"取消" destructiveButtonTitle:@"立即拍照上传" otherButtonTitles:@"从手机相册选取",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    //    [actionSheet setDelegate:self];
    [self.view endEditing:YES];
    [actionSheet showInView:self.view];

    
}
#pragma mark - UIActionSheet协议
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0)
    {          UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imgPicker animated:YES completion:^{}];
        
    }
    if (buttonIndex ==1) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imgPicker animated:YES completion:^{}];
        
    }
    else
        return;
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [_img setImage:image];
    [_input_view addSubview:_img];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    return;
}
@end
