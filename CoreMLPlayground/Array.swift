//
//  Array.swift
//  CoreMLPlayground
//
//  Created by Loic on 8/6/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import Foundation


extension Array {
    func chunk( chunkSize size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map({ (startIndex) -> [Element] in
            let endIndex = (startIndex.advanced(by: size) > self.count) ? self.count-startIndex : size
            return Array(self[startIndex..<startIndex.advanced(by: endIndex)])
        })
    }
    
}
