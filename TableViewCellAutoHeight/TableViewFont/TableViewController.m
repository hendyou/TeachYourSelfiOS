//
//  TableViewController.m
//  TableViewFont
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initContentArray
{
    //    self.listArray = [UIFont familyNames];
    self.listArray = @[
                       @"入室安慰宝玉的袭人发现宝玉梦遗。回到荣府后，宝玉把梦中云雨之事相告并与袭人偷试云雨，从此袭人与宝玉更加亲密。一日，王夫人的远亲刘姥姥带着外孙板儿到贾府拉关系，来到之后方知道现在王夫人的内侄女王熙凤管家。开始误以为王熙凤之陪嫁丫鬟平儿是凤姐，后来又见到贾蓉来借玻璃炕屏。时值风光的王熙凤还算慷慨地接济了刘姥姥，于此种下善因。",
                       @"宝玉准备入塾，袭人为他收拾妥当，叮嘱宝玉功课不必过于操劳。宝玉向家中长辈辞行之后，又独去向黛玉作辞，不辞宝钗。薛蟠听说义学热闹，也来上学。上学期间，宝玉与秦钟形影不离，引发不少风言风语。秦钟又因与“香怜”交好而引发贾家远亲金荣（贾璜之妻的侄儿）争风吃醋，适逢代儒外出，其孙儿贾瑞代课，处理不公，引发学堂内的一场大混战。贾蔷挑拨宝玉小厮茗烟大打出手，最后以金荣被迫磕头道歉而告一段落。",
                       @"凤姐主持操办丧事，整顿宁府内务，威重令行，赏罚分明，进展顺利。",
                       @"贾府仆人周瑞之妻送走刘姥姥寻王夫人回复，在梨香院见到宝钗，听冷香丸之说，又见香菱，感觉像秦可卿，后又奉薛夫人之命把皇宫式样的扎花送予王熙凤、林黛玉等。周瑞之妻到惜春处，惜春正跟尼姑智能玩，戏称自己要是剃发出家，花往哪里戴。周瑞之妻到王熙凤处时，王熙凤正值与其夫贾琏在房中嬉戏，宫花由平儿代为收下。周瑞之妻继而寻林黛玉，于宝玉房中得见，黛玉得知宫花是众姑娘皆有的，表示不屑。次日，宝玉随王熙凤于宁国府会秦氏之弟秦钟，宝玉喜秦钟俊俏，相约同上贾府家塾中念书。回程时，得闻宁府老仆焦大酒后“爬灰”、“养小叔子”等骂语。",
                       @"宝玉与北静王相见甚欢，北静王将皇上所赐鹡鸰香念珠一串赠予宝玉，并劝贾政不可溺爱宝玉，以免荒废学业。出殡队伍经过农庄休整，宝玉、秦钟遇见村姑二丫头，率性可爱，宝玉恨不得跟随她去。"
                       ];
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
    [self initContentArray];
    
    _tableView = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStyleGrouped];
    //实现数据源方法
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
//    _tableView.allowsSelection = NO;
}

- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier    ] autorelease];
    }
    cell.textLabel.text = self.listArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

#pragma mark - TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //*******关键点:让cell根据文字自适应高度********
    NSString *text = [_listArray objectAtIndex:indexPath.row];
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(280, 1000)];
    return size.height + 20;
}
@end
