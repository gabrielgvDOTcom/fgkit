//
//  FGErrorStyled.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/29/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

open class FGErrorStyled: NSObject {
    
    open var title: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue-Bold", size: 22)!,
            color: UIColor.darkGray
        )
    }
    open var message: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue", size: 16)!,
            color: UIColor.darkGray
        )
    }
    open var retry: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue-Bold", size: 15)!,
            color: UIColor.darkGray
        )
    }
    open var retryIcon: Styled.Icon {
        return Styled.Icon(
            name: "refresh-icon",
            color: UIColor.darkGray,
            size: 25
        )
    }

    // MARK: - Functions
    struct StaticData {
        static var sharedInstance: FGErrorStyled?
    }
    open class func shared() -> FGErrorStyled {
        if StaticData.sharedInstance == nil {
            StaticData.sharedInstance = FGErrorStyled()
        }
        return StaticData.sharedInstance!
    }
    open class func setShared(_ shared: FGErrorStyled) {
        StaticData.sharedInstance = shared
    }
}
