//
//  CollectionViewCell.swift
//  CoreMLPlayground
//
//  Created by Loic on 8/6/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    var indexPath: IndexPath? {
        return (superview as? UICollectionView)?.indexPath(for: self)
    }
    
}

