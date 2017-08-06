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
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        addSubview(collectionView)
        
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    func setupCollectionView() {
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
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