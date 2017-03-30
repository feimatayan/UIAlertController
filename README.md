# UIAlertController

1、下边是使用alert方法，
 AlertControllerView *alertOn = [[AlertControllerView alloc] initStyle:UIAlertControllerStyleAlert andTitle:@"title" andContent:@"你好" andConfirm:^(id confirmBlock) {
        NSLog(@"点击确定");

    } andConfirmTitle:@"确定" andCancelBlock:^(id cacel) {
        NSLog(@"点击取消");

    } andCancelTitle:@"取消" andSheetArr:nil andDestructiveIndex:0 andClickIndexBlock:^(id clickIndexBlock) {
    }];
    
 2、下边是sheet方法
 NSArray *arr = @[@"1",@"2",@"3"];
    AlertControllerView *sheet = [[AlertControllerView alloc] initStyle:UIAlertControllerStyleActionSheet andTitle:nil andContent:nil andConfirm:nil andConfirmTitle:nil andCancelBlock:^(id cacel) {
        NSLog(@"点击取消");
    } andCancelTitle:@"取消" andSheetArr:arr andDestructiveIndex:2 andClickIndexBlock:^(id clickIndexBlock) {
        NSLog(@"点击%ld",[clickIndexBlock integerValue]);

    }];
    [self presentViewController:sheet animated:YES completion:^{
        
    }];
 3、 参数说明：
    1、 initStyle：UIAlertControllerStyleAlert和UIAlertControllerStyleActionSheet，这两种弹出方式
    2、andTitle:标题可以为空，可以传nil
    3、andContent:内容可以为空，sheet类型可以不传
    4、andConfirm:^(id confirmBlock)：alert类型，对点击确定回调，sheet类型：不用传，传nil就行
    5、 andConfirmTitle：alert类型，按钮确定的名字，不传默认为确定，sheet传nil
    6、andCancelBlock:^(id cacel):alert和sheet都是取消回调
    7、andCancelTitle：alert和sheet，按钮取消的名字，不传默认为取消,
    8、andSheetArr:alert类型传nil,sheet类型传数组，现在只支持要显示的名字，如有需要可以自行修改
    9、andDestructiveIndex：alert类型不传，sheet类型：要显示第几个为红色，传几，不需要传，传arr.count或者超过数组的长度即可
    10、andClickIndexBlock:^(id clickIndexBlock)：alert类型传nil,sheet类型回调点击了第几个
    
    
    
        
