//
//  CellObject.h
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол, использующийся для получения идентификатора ячейки 
 в зав-ти от ее класса
 */

@protocol CellObject <NSObject>
@required
- (Class)cellClass;
@end
