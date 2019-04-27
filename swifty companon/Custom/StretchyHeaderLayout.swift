//
//  StretchyHeaderLayout.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 26/04/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {

    // we want to modify the attribute of our header component somehow
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                guard let cv = collectionView else { return }
                let contentOffsetY = cv.contentOffset.y
                if contentOffsetY > 0 {
                    return
                }
                let width = cv.frame.width
                let height = attribute.frame.height - contentOffsetY
                
                attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
