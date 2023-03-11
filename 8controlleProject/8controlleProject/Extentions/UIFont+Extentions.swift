//
//  UIFont+Extentions.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 11.03.2023.
//

import UIKit


extension UIFont {
    
    // weight = 300
    static func customLightFont(size: CGFloat) -> UIFont {

        guard let customFont = UIFont(name: "Ubuntu-Light", size: size) else { fatalError("error") }
            return customFont
    }
    
    // weight = 400
    static func customRegularFont(size: CGFloat) -> UIFont {

        guard let customFont = UIFont(name: "Ubuntu-Regular", size: size) else { fatalError("error") }
            return customFont
    }
    
    // weight = 500
    static func customMediumFont(size: CGFloat) -> UIFont {

            guard let customFont = UIFont(name: "Ubuntu-Medium", size: size) else { fatalError("error") }
            return customFont
    }
    
    // weight = 700
    static func customBoldFont(size: CGFloat) -> UIFont {

        guard let customFont = UIFont(name: "Ubuntu-Bold", size: size) else { fatalError("error") }
            return customFont
    }
    
}
