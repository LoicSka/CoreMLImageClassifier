//
//  ContainerCollectionViewCell.swift
//  CoreMLPlayground
//
//  Created by Loic on 8/6/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import UIKit

fileprivate let cellId = "imageCell"

class ContainerCollectionViewCell: BaseCollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var tagItem: Int? {
        didSet {
            setupCollectionView()
        }
    }
    
    var images = [UIImage]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let tagLabel = UILabel().then {
        $0.textColor = .clearBlue
        $0.font = UIFont(name: $0.font.fontName, size: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setupViews() {
        
        backgroundColor = .white
        addSubview(tagLabel)
        
        tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        tagLabel.widthAnchor.constraint(equalToConstant: frame.width - 40).isActive = true
        tagLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tagLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupCollectionView() {
        
        addSubview(collectionView)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        if let index = tagItem {
            let cond = index % 2 == 0
            collectionView.fillParentView(padLeft: cond ? 20 : 10, padRight:  cond ? -10 : -20, padTop: 20, padBottom: -30)
        } else {
            collectionView.fillParentView(padLeft: 10, padRight: -10, padTop: 0, padBottom: -50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCollectionViewCell
        if images.count >= indexPath.item + 1 {
            cell.imageView.image  = images[indexPath.item]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width/2) - 1
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
}
