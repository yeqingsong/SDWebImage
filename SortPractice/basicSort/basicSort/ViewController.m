//
//  ViewController.m
//  basicSort
//
//  Created by tangyunchuan on 2019/3/8.
//  Copyright © 2019 yqs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *dataArray;
    NSMutableArray *mergeArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    dataArray = [NSMutableArray array];
    mergeArray = [NSMutableArray array];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(sortArray) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}
- (void)sortArray{
    
    NSInteger count = arc4random()%10 + 10;
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        NSInteger num = arc4random()%200;
        [array addObject:@(num)];
    }
    dataArray = array;
//    [self bubbleSort];
//    [self chooseSort];
//    [self quickSort];
//    [self shellSort];
//    [self heapSort];
//    [self mergingSort];
    NSLog(@"%@",dataArray);
}
- (void)heapSort{
    
    
    
}
- (void)mergingSort{
    [mergeArray removeAllObjects];
    [self chartArray:0 right:dataArray.count - 1];
    
}
- (void)chartArray:(NSInteger)left right:(NSInteger)right{
    if (left >= right) {
        return;
    }
    NSInteger l = left;
    NSInteger r = right;
    NSInteger center = (l+r)/2;
    [self chartArray:left right:center];
    [self chartArray:center+1 right:right];
    
    [self merging:left right:right];
}
- (void)merging:(NSInteger)left right:(NSInteger)right{
    for (NSInteger i = left; i<=right; i++) {
        [mergeArray addObject:@""];
    }
    NSInteger l = left;
    NSInteger r = right;
    NSInteger center1 = (left+right)/2;
    NSInteger center = (left+right)/2;
    NSInteger ml = left;
    while (l <= center && center+1 <= r) {
        while (dataArray[l] > dataArray[center + 1]&&center+1<=right) {
            [mergeArray replaceObjectAtIndex:ml withObject:dataArray[center + 1]];
            ml++;
            center++;
        }
        while (dataArray[l] < dataArray[center + 1]&&center+1<=right) {
            [mergeArray replaceObjectAtIndex:ml withObject:dataArray[l]];
            l++;
            ml++;
        }
    }
    for (NSInteger i = l; i <= center1; i++) {
        [mergeArray replaceObjectAtIndex:i withObject:dataArray[i]];
    }

    
}
- (void)shellSort{
    NSInteger gap = dataArray.count/2;
    while (gap >= 1) {
        for (NSInteger i = dataArray.count - 1; i >= 0; i = i-gap) {
            for (NSInteger j = dataArray.count - 1; j >= gap; j = j - gap) {
                if (dataArray[j] < dataArray[j - gap]) {
                    [dataArray exchangeObjectAtIndex:j withObjectAtIndex:j-gap];
                }
            }
        }
        gap = gap/2;
    }
}
- (void)quickSort{
    
    NSInteger r = dataArray.count - 1;
    NSInteger l = 0;
    [self quickSortLeft:l right:r];

}

- (void)quickSortLeft:(NSInteger)left right:(NSInteger)right{
    NSInteger l = left;
    NSInteger r = right;
    if (l >= r) {
        return;
    }
    NSNumber *num = dataArray[l];
    while (r > l) {
        while (num < dataArray[r]&&r>l) {
            r--;
        }
        if (num >= dataArray[r]&&r>l) {
            [dataArray replaceObjectAtIndex:l withObject:dataArray[r]];
            l++;
        }
        
        while (num > dataArray[l]&&r>l) {
            l++;
        }
        if (num < dataArray[l]&&r>l) {
            [dataArray replaceObjectAtIndex:r withObject:dataArray[l]];
            r --;
        }
    }
    [dataArray replaceObjectAtIndex:l withObject:num];
    [self quickSortLeft:l+1 right:right];
    [self quickSortLeft:left right:l-1];
}
- (void)bubbleSort{
    for (int i = 0; i < dataArray.count-1; i++) {
        for (NSInteger j = dataArray.count - 2; j >= i; j--) {
            NSNumber *num = dataArray[j];
            NSNumber *num1 = dataArray[j+1];
            if (num > num1) {
                [dataArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}
- (void)chooseSort{
    for (int i = 0; i < dataArray.count-1; i++) {
        NSNumber *num = dataArray[i];
        NSInteger count = i;
        for (int j = i + 1; j < dataArray.count; j++) {
            NSNumber *num1 = dataArray[j];
            if (num1 < num) {
                num = num1;
                count = j;
                [dataArray exchangeObjectAtIndex:j withObjectAtIndex:i];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



























@end
