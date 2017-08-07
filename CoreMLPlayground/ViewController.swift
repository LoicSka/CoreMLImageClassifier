//
//  ViewController.swift
//  CoreMLPlayground
//
//  Created by Loic on 8/6/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import UIKit
import Photos

fileprivate let cellId = "cell"

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let model = GoogLeNetPlaces()
    
    var imageArray = [UIImage]()
    var imageDict = [String : [UIImage]]()
    
    var imageGroups = [[UIImage]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        grabPhotos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        grabPhotos()
        collectionView?.reloadData()
    }
    
    
    func sceneLabel(forImage image: UIImage) -> String? {
        
        if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
            
            guard let prediction = try? model.prediction(sceneImage: pixelBuffer) else {fatalError("Fatal runtime error")}
            return prediction.sceneLabel
        }
        
        return nil
    }
    
    func grabPhotos() {
        
        imageDict.removeAll()
        let imageManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        if fetchResult.count > 0 {

            for i in 0 ..< fetchResult.count {
                imageManager.requestImage(for: fetchResult.object(at: i), targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFill, options: requestOptions, resultHandler: {
                    image, error in
                    if let label = self.sceneLabel(forImage: image!.scaleImage(toSize: CGSize(width:112, height: 112))!) {
                        if self.imageDict[label] != nil {
                            self.imageDict[label]!.append(image!)
                        } else {
                            self.imageDict[label] = [image!]
                        }
                    }
                    
                })
            }
        }else {
            
            print("NO PHOTOS FOUND.")
        }
        
    }
    
    
    func setupCollectionView() {
        collectionView?.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPrefetchingEnabled = true
        collectionView?.backgroundColor = .white
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDict.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ContainerCollectionViewCell
        cell.tagItem = indexPath.item
        cell.images = Array(imageDict.values)[indexPath.item]
        cell.tagLabel.text = "#\(Array(imageDict.keys)[indexPath.item])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 1
        return CGSize(width: width, height: width + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    


}

