//
//  FGPageStyled.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/28/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

open class FGPageStyled: NSObject {
    
    open var headerTitle: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue", size: 14)!,
            color: UIColor.darkGray
        )
    }
    open var headerTitleSelected: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            color: UIColor(hex: "43388F")
        )
    }
    open var minimumLineSpacing: CGFloat {
        return UIScreen.main.bounds.width / 4.0
    }
    open var headerBGColor: UIColor {
        return UIColor.white
    }
    open var headerBGSelected: UIColor {
        return UIColor(hex: "43388F")
    }
    
    //MARK: - Functions
    struct StaticData {
        static var sharedInstance: FGPageStyled?
    }
    open class func shared() -> FGPageStyled {
        if StaticData.sharedInstance == nil {
            StaticData.sharedInstance = FGPageStyled()
        }
        return StaticData.sharedInstance!
    }
    open class func setShared(_ shared: FGPageStyled) {
        StaticData.sharedInstance = shared
    }
}
