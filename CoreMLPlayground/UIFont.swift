//
//  UIFont.swift
//  Cozy
//
//  Created by Loic on 7/15/17.
//  Copyright © 2017 3sparks. All rights reserved.
//

import UIKit

extension UIFont {
    class func workSansMedium(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "WorkSans-Medium", size: size)
    }
    
    class func gothamRoundedBook(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamRounded-Book", size: size)
    }
    
    class func gothamRoundedMedium(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamRounded-Medium", size: size)
    }
    
    class func gothamRoundedBold(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamRounded-Bold", size: size)
    }
    
    class func gothamRoundedLight(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamRoundedLight", size: size)
    }
    
    class func sfUITextRegular(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "SFUIText-Regular", size: size)
    }
    
    class func sfUITextSemiBold(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "SFUIText-Semibold", size: size)
    }
}

