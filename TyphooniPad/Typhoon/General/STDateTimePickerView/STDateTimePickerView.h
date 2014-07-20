//
//  STDateTimePickerView.h
//  SHPDSW
//
//  Created by Shiqyn on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHoursCnt 24
#define kMinuteCnt 60
@protocol STDateTimePickerViewDelegate;
@interface STDateTimePickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView* customPickerView;
    
    NSArray* hoursArray;
    NSArray* minutesArray;
    NSArray* yearsArray;
    NSArray* monthsArray;
    NSDictionary* daysDict;
    
    NSArray* has31DayMonthsArray;
    
    __unsafe_unretained id<STDateTimePickerViewDelegate>delegate;
    
    NSArray* currentDaysArray;
    
    int theYear;
    int theMonth;
    int theDay;
    int theHour;
    int theMinute;
    
    NSString* theCurrentTimeString; //格式2012-09-09 11:11
    
    BOOL isNeedRefreshDaysComponent;
    NSString* thePreDaysComponentSelectedString;
}
@property(nonatomic, assign)    int theYear;
@property(nonatomic, assign) int theMonth;
@property(nonatomic, assign) int theDay;
@property(nonatomic, assign) int theHour;
@property(nonatomic, assign) int theMinute;
@property(nonatomic, copy)NSString* theCurrentTimeString;
@property(nonatomic, readonly)UIPickerView* customPickerView;


@property(nonatomic, assign)id<STDateTimePickerViewDelegate>delegate;


- (void)setDataTimePickkerTime:(NSDate *)date ;


@end


@protocol STDateTimePickerViewDelegate <NSObject>

@optional
-(void)stDateTimePickerViewCurrentTimeChange:(STDateTimePickerView *)pickerView;



@end

