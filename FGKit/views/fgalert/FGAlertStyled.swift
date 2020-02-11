//
//  FGAlertStyledd.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

public extension Styled {
        
    struct FGAlert {

        static let BGView = FGAlertStyled.shared().bgView
        static let ContentView = FGAlertStyled.shared().contentView
        static let Title = FGAlertStyled.shared().title
        static let Message = FGAlertStyled.shared().message
        static let DoneButton = FGAlertStyled.shared().doneButton
        static let ActionButton = FGAlertStyled.shared().actionButton
    }
}
open class FGAlertStyled: NSObject {

    //MARK: - VARs
    open var contentView: Styled.View {
        return Styled.View(
            bgColor: UIColor.white,
            corner: 5.0,
            shadow: nil
        )
    }
    open var bgView: Styled.View {
        return Styled.View(
            bgColor: UIColor.black.withAlphaComponent(0.9),
            corner: 0.0,
            shadow: nil
        )
    }
    open var title: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            color: UIColor.darkGray
        )
    }
    open var message: Styled.Text {
        return Styled.Text(
            font: UIFont(name: "HelveticaNeue", size: 14)!,
            color: UIColor.darkGray
        )
    }
    open var actionButton: Styled.Button {
        return Styled.Button(
            font: UIFont(name: "HelveticaNeue", size: 14)!,
            bgColor: UIColor.red,
            tintColor: UIColor.white,
            corner: 5.0,
            image: nil
        )
    }
    open var doneButton: Styled.Button {
        return Styled.Button(
            font: UIFont(name: "HelveticaNeue", size: 14)!,
            bgColor: UIColor.gray,
            tintColor: UIColor.white,
            corner: 5.0,
            image: nil
        )
    }

    //MARK: - Functions
    struct StaticData {
        static var sharedInstance: FGAlertStyled?
    }
    open class func shared() -> FGAlertStyled {
        if StaticData.sharedInstance == nil {
            StaticData.sharedInstance = FGAlertStyled()
        }
        return StaticData.sharedInstance!
    }
    open class func setShared(_ shared: FGAlertStyled) {
        StaticData.sharedInstance = shared
    }
}
