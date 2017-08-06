//
//  ImageCollectionViewCell.swift
//  CoreMLPlayground
//
//  Created by Loic on 8/6/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = UIImageView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 6
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor.white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setupViews() {
        addSubview(imageView)
        
        imageView.image = UIImage(named: "image01")
        imageView.fillParentView(padLeft: 0, padRight: 0, padTop: 0, padBottom: 0 )
    }
    
}
