# FSActionSheet
模仿微信底部ActionSheet, 已适配横竖屏.<p>
几种效果样式如图:<p>
![Example screenshot](https://raw.githubusercontent.com/lifution/TestImages/master/FSActionSheetShot/ScreenShot.jpg)<p>
<P>
类UIActionSheet初始化绑定代理和设置标题:<p>
```Objective-C
FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:_actionSheetTitle delegate:nil cancelButtonTitle:@"关闭" highlightedButtonTitle:@"删除" otherButtonTitles:@[@"拍照", @"从相册选取"]];
    actionSheet.contentAlignment = FSContentAlignmentLeft;
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        _label.text = [NSString stringWithFormat:@"选择了第[%zi]项", selectedIndex];
    }];
```