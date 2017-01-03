//
//  TagModel.m
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import "JHTagModel.h"

@interface JHTagModel ()

@end

@implementation JHTagModel

- (void)setText:(NSString *)text{
    _text = text;
}

- (void)setFont:(CGFloat)font{
    _font = font;
    self.size = [self.text sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:self.font]}];
}

- (CGFloat)width{
    return self.size.width + self.widthMargin;
}

- (CGFloat)height{
    return self.size.height + self.heightMargin;
}


+ (instancetype)random{
    JHTagModel * model = [[JHTagModel alloc]init];
    model.text = [self randomStrWithLength:arc4random()%8+1];
    model.font = 15;
    model.widthMargin = 10;
    model.heightMargin = 5;
    model.isSelect = arc4random()%2;
    
    return model;
}


+ (NSString *)randomStrWithLength:(int)length{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

@end
