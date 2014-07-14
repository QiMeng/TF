//
//  STDateTimePickerView.m
//  SHPDSW
//
//  Created by Shiqyn on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "STDateTimePickerView.h"

#define kBigMonthDaysKey @"BigMonthDaysKey"
#define kSmallMonthDaysKey @"SmallMonthDaysKey"

#define kLeapYearFebDaysKey @"LeapYearFebDaysKey"
#define kNotLeapYearFebDaysKey @"notLeapYearFebDaysKey"

#define kDataCopyCnt 20

#define kYearComponentWidth 65
#define kHourMinuteRowWidth 52

@interface STDateTimePickerView()
@property(nonatomic, retain) NSArray* hoursArray;
@property(nonatomic, retain)NSArray* minutesArray;

@property(nonatomic, retain)    NSArray* yearsArray;
@property(nonatomic, retain)NSArray* monthsArray;
@property(nonatomic, retain) NSDictionary* daysDict;
@property(nonatomic, retain)NSArray* currentDaysArray;
@property(nonatomic, copy)NSString* thePreDaysComponentSelectedString;
@property(nonatomic, retain)NSArray* has31DayMonthsArray;


@end

@implementation STDateTimePickerView
@synthesize theDay, theHour, theYear, theMonth, theMinute;
@synthesize hoursArray, minutesArray;
@synthesize currentDaysArray;
@synthesize delegate;
@synthesize theCurrentTimeString;
@synthesize thePreDaysComponentSelectedString;

@synthesize has31DayMonthsArray;
@synthesize customPickerView;
@synthesize  yearsArray, monthsArray, daysDict;
#pragma mark - View lifecycle



-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        if(!customPickerView)
        {
            customPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0 , frame.size.width, frame.size.height)];
            customPickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            customPickerView.dataSource = self;
            customPickerView.delegate = self;
            
            customPickerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:179.0/255 green:224.0/255 blue:255.0/255 alpha:1];
            
            NSMutableArray* hoursTmp = [[NSMutableArray alloc] init];
            NSMutableArray* minutesTmp = [[NSMutableArray alloc] init];
            NSMutableArray* yearsArrayTmp = [[NSMutableArray alloc] init];
            NSMutableArray* monthArrayTmp = [[NSMutableArray alloc] init];
            
            
            NSMutableArray* bigMonthDaysArrayTmp = [[NSMutableArray alloc] init];
            NSMutableArray* smallMonthDaysArrayTmp = [[NSMutableArray alloc] init];
            
            NSMutableArray* leapYearFebDaysArrayTmp = [[NSMutableArray alloc] init];
            NSMutableArray* notLeapYearFebDaysArrayTmp = [[NSMutableArray alloc] init];
            
            self.has31DayMonthsArray = [NSArray arrayWithObjects:@"01", @"03" , @"05",  @"07", @"08", @"10", @"12",nil];
            
            for(int i=1; i<=12; i++)
                [monthArrayTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            for(int i = 1850; i<1000+1850; i++)
                [yearsArrayTmp addObject:[NSString stringWithFormat:@"%d", i]];
            
            for(int i=0; i<kHoursCnt; i++)
                [hoursTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            for(int i=0; i<kMinuteCnt; i++)
                [minutesTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            for(int i=1; i<=31; i++)
                [bigMonthDaysArrayTmp addObject:[NSString stringWithFormat:@"%02d",i]];
            
            for(int i=1; i<=30; i++)
                [smallMonthDaysArrayTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            for(int i=1; i<=28; i++)
                [notLeapYearFebDaysArrayTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            for(int i=1;i<=29; i++)
                [leapYearFebDaysArrayTmp addObject:[NSString stringWithFormat:@"%02d", i]];
            
            
            self.monthsArray = monthArrayTmp;
            self.yearsArray = yearsArrayTmp;
            self.hoursArray = hoursTmp;
            self.minutesArray = minutesTmp;
            
//            [monthArrayTmp release];
//            [yearsArrayTmp release];
//            [hoursTmp release];
//            [minutesTmp release];

            QMRelease(monthArrayTmp);
            QMRelease(yearsArrayTmp);
            QMRelease(hoursTmp);
            QMRelease(minutesTmp);
            
            
            [customPickerView  selectRow:180  inComponent:0 animated:NO];
            [customPickerView  selectRow:200 inComponent:1 animated:NO];
            [customPickerView  selectRow:200 inComponent:2 animated:NO];
            [customPickerView  selectRow:200 inComponent:3 animated:NO];
            [customPickerView  selectRow:200 inComponent:4 animated:NO];
            customPickerView.showsSelectionIndicator = YES;
            
            
            
            self.daysDict = [NSDictionary dictionaryWithObjectsAndKeys: bigMonthDaysArrayTmp, kBigMonthDaysKey,
                             smallMonthDaysArrayTmp, kSmallMonthDaysKey,
                             leapYearFebDaysArrayTmp, kLeapYearFebDaysKey,
                             notLeapYearFebDaysArrayTmp, kNotLeapYearFebDaysKey,nil];
            
//            [bigMonthDaysArrayTmp release];
//            [smallMonthDaysArrayTmp release];
//            [leapYearFebDaysArrayTmp release];
//            [notLeapYearFebDaysArrayTmp release];
            
            QMRelease(bigMonthDaysArrayTmp);
            QMRelease(smallMonthDaysArrayTmp);
            QMRelease(leapYearFebDaysArrayTmp);
            QMRelease(notLeapYearFebDaysArrayTmp);
            
            
        }
        [self addSubview:customPickerView];
    }
    
    return self;
}


#pragma mark -UIPickerViewDelegate&UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return self.yearsArray.count;
    else if(component == 1)
        return kDataCopyCnt*self.monthsArray.count;
    else if(component == 2)
    {
        int year = [[self.yearsArray objectAtIndex:[customPickerView selectedRowInComponent:0]] intValue];
        int month = [[self.monthsArray objectAtIndex:[customPickerView selectedRowInComponent:1]%self.monthsArray.count] intValue];
        
        if(month == 2)
        {
            if((year%4==0&&year%100!=0)||(year%400==0) )
                self.currentDaysArray = [self.daysDict objectForKey:kLeapYearFebDaysKey];
			else
                self.currentDaysArray  = [self.daysDict objectForKey:kNotLeapYearFebDaysKey];
        }
        else
        {
            if([self.has31DayMonthsArray indexOfObject:[NSString stringWithFormat:@"%02d", month]] != NSNotFound)
                self.currentDaysArray = [self.daysDict objectForKey:kBigMonthDaysKey];
            else
                self.currentDaysArray = [self.daysDict objectForKey:kSmallMonthDaysKey];
        }
        
        
        return self.currentDaysArray.count*kDataCopyCnt;
    }
    
    else if(component == 3)
     	return  kDataCopyCnt*kHoursCnt;
    else if(component == 4)
        return kDataCopyCnt*kMinuteCnt;
    
    return 0;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(component == 0)
	    return  kYearComponentWidth;
    
    return kHourMinuteRowWidth;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
        return [NSString stringWithFormat:@"%@年", [self.yearsArray objectAtIndex:row]];
    else if(component == 1)
        return [NSString stringWithFormat:@"%@月", [self.monthsArray objectAtIndex:row%[self.monthsArray count]]];
    else if(component ==2)
    {
        if(isNeedRefreshDaysComponent)
        {
            isNeedRefreshDaysComponent = NO;
    		if([self.currentDaysArray  indexOfObject:[NSString stringWithFormat:@"%d", [self.thePreDaysComponentSelectedString intValue]]] == NSNotFound)
            {
                [pickerView selectRow:0 inComponent:component animated:NO];
            }
        }
        
        return [NSString stringWithFormat:@"%@日", [self.currentDaysArray objectAtIndex:row%self.currentDaysArray.count]];
    }
    else if(component == 3)
	    return [NSString stringWithFormat:@"%@时", [self.hoursArray objectAtIndex:row%kHoursCnt]];
    else if(component == 4)
        return [NSString stringWithFormat:@"%@分", [self.minutesArray objectAtIndex:row%kMinuteCnt]];
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0 || component == 1)
    {
        isNeedRefreshDaysComponent = YES;
        self.thePreDaysComponentSelectedString = [self.currentDaysArray objectAtIndex:([pickerView selectedRowInComponent:2]%self.currentDaysArray.count)];
        
        
        int year = [[self.yearsArray objectAtIndex:[customPickerView selectedRowInComponent:0]] intValue];
        int month = [[self.monthsArray objectAtIndex:[customPickerView selectedRowInComponent:1]%self.monthsArray.count] intValue];
        
        if(month == 2)
        {
            if((year%4==0&&year%100!=0)||(year%400==0) )
                self.currentDaysArray = [self.daysDict objectForKey:kLeapYearFebDaysKey];
            else
                self.currentDaysArray  = [self.daysDict objectForKey:kNotLeapYearFebDaysKey];
        }
        else
        {
            if([self.has31DayMonthsArray indexOfObject:[NSString stringWithFormat:@"%02d", month]] != NSNotFound)
                self.currentDaysArray = [self.daysDict objectForKey:kBigMonthDaysKey];
            else
                self.currentDaysArray = [self.daysDict objectForKey:kSmallMonthDaysKey];
        }
        
        if([self.currentDaysArray indexOfObject:self.thePreDaysComponentSelectedString] == NSNotFound)
        {
            [customPickerView selectRow:(kDataCopyCnt/2)*self.currentDaysArray.count inComponent:2 animated:NO];
        }
        else
            [customPickerView selectRow:(kDataCopyCnt/2)*self.currentDaysArray.count+[self.currentDaysArray indexOfObject: self.thePreDaysComponentSelectedString]
                            inComponent:2 animated:NO];
        
        [customPickerView reloadComponent:2];
        
        //--------
        
    }
    
    self.theCurrentTimeString = [NSString stringWithFormat:@"%@-%@-%@ %@:%@", [self.yearsArray objectAtIndex:[customPickerView selectedRowInComponent:0]],
                                 [self.monthsArray objectAtIndex:[customPickerView selectedRowInComponent:1]%self.monthsArray.count],
                                 [self.currentDaysArray objectAtIndex:[customPickerView selectedRowInComponent:2]%self.currentDaysArray.count],
                                 [self.hoursArray objectAtIndex:[customPickerView selectedRowInComponent:3]%self.hoursArray.count],
                                 [self.minutesArray objectAtIndex:[customPickerView selectedRowInComponent:4]%self.minutesArray.count]];
    
    if([delegate respondsToSelector:@selector(stDateTimePickerViewCurrentTimeChange:)])
        [delegate stDateTimePickerViewCurrentTimeChange:self];
}

- (UIView *)pickerView:(UIPickerView *)pv viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* label =(UILabel*)view;
    if(!label)
    {
        CGSize size = [customPickerView rowSizeForComponent:component];
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        QMAutorelease(label);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont boldSystemFontOfSize:14.5];
        if(component == 0)
            label.text = [NSString stringWithFormat:@"%@年", [self.yearsArray objectAtIndex:row]];
        else if(component == 1)
            label.text = [NSString stringWithFormat:@"%@月", [self.monthsArray objectAtIndex:row%self.monthsArray.count]];
        else if(component == 2)
        {
            label.text = [NSString stringWithFormat:@"%@日", [self.currentDaysArray objectAtIndex:row%self.currentDaysArray.count]];
            
        }
        else if(component == 3)
	        label.text = [NSString stringWithFormat:@"%@时", [self.hoursArray objectAtIndex:row%kHoursCnt]];
        else if(component == 4)
            label.text =  [NSString stringWithFormat:@"%@分", [self.minutesArray objectAtIndex:row%kMinuteCnt]];
        
    }
    else
    {
        CGSize size = [customPickerView rowSizeForComponent:0];
        label.frame = CGRectMake(0, 0, size.width, size.height);
        if(component == 0)
            label.text = [NSString stringWithFormat:@"%@年", [self.yearsArray objectAtIndex:row]];
        else if(component == 1)
            label.text = [NSString stringWithFormat:@"%@月", [self.monthsArray objectAtIndex:row%self.monthsArray.count]];
        else if(component == 2)
        {
            label.text = [NSString stringWithFormat:@"%@日", [self.currentDaysArray objectAtIndex:row%self.currentDaysArray.count]];
        }
        else if(component == 3)
	        label.text = [NSString stringWithFormat:@"%@时", [self.hoursArray objectAtIndex:row%kHoursCnt]];
        else if(component == 4)
            label.text =  [NSString stringWithFormat:@"%@分", [self.minutesArray objectAtIndex:row%kMinuteCnt]];
        
    }
    return label;
}


#pragma mark - Setter

- (void)setDataTimePickkerTime:(NSDate *)date  {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    //int week=0;
    comps = [calendar components:unitFlags fromDate:date];
    //    int week = [comps weekday];
    int year=[comps year];
    int month = [comps month];
    int day = [comps day];
    
    int hour = [comps hour];
    int min = [comps minute];

    [self setTheYear:year];
    [self setTheMonth:month];
    [self setTheDay:day];
    [self setTheHour:hour];
    [self setTheMinute:min];
}


-(void)setTheYear:(int)year
{
    theYear = year;
    [customPickerView selectRow:[self.yearsArray indexOfObject:[NSString stringWithFormat:@"%d", theYear]]
                    inComponent:0
                       animated:YES];
    [customPickerView reloadComponent:2];
}
-(void)setTheMonth:(int)month
{
    theMonth = month;
    [customPickerView selectRow:kDataCopyCnt/2*self.monthsArray.count+[self.monthsArray indexOfObject:[NSString stringWithFormat:@"%02d", theMonth]]
                    inComponent:1
                       animated:YES];
    [customPickerView reloadComponent:2];
}
-(void)setTheDay:(int)day
{
    theDay  = day;
    [customPickerView selectRow:kDataCopyCnt/2*self.currentDaysArray.count+[self.currentDaysArray indexOfObject:[NSString stringWithFormat:@"%02d", theDay]]
                    inComponent:2 animated:YES];
    
}
-(void)setTheHour:(int)hour
{
    theHour = hour;
    [customPickerView selectRow:10*kHoursCnt+[self.hoursArray indexOfObject:[NSString stringWithFormat:@"%02d", theHour]]
                    inComponent:3
                       animated:YES];
}

-(void)setTheMinute:(int)minute
{
    theMinute = minute;
    [customPickerView selectRow:10*kMinuteCnt+[self.minutesArray indexOfObject:[NSString stringWithFormat:@"%02d", theMinute]]
                    inComponent:4
                       animated:YES];
}

#pragma mark - dealloc
-(void)dealloc
{
//    [has31DayMonthsArray release];
//    
//    [currentDaysArray release];
//    
//    [customPickerView release];
//    
//    [minutesArray release];
//    [hoursArray release];
//    
//    [yearsArray release];
//    [monthsArray release];
//    [daysDict release];
//    [theCurrentTimeString release];
//    [thePreDaysComponentSelectedString release];
    
    
    QMRelease(has31DayMonthsArray);
    QMRelease(currentDaysArray);
    QMRelease(customPickerView);
    QMRelease(minutesArray);
    QMRelease(hoursArray);
    QMRelease(yearsArray);
    QMRelease(monthsArray);
    QMRelease(monthsArray);
    QMRelease(daysDict);
    QMRelease(theCurrentTimeString);
    QMRelease(thePreDaysComponentSelectedString);
    
    
    
#if ! __has_feature(objc_arc)
    [super dealloc];
#else
    
#endif
}

@end
