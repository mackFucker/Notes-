//
//  ViewController.h
//  To do list objc
//
//  Created by дэвид Кихтенко on 31.07.2023.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import <Foundation/Foundation.h>
#import "NoteModel.h"

@interface MainScreenViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    UICollectionView *_collectionView;
}
@end
