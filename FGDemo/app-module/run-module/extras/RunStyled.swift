//
//  RunStyle.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

extension Styled {
    
    struct Run {
        
        static let DefaultBox = Styled.View(
            bgColor: UIColor.groupTableViewBackground,
            corner: 10.0
        )
        static let DefaultButton = Styled.Button(
            font: UIFont(.medium, size: 14),
            bgColor: UIColor.gray,
            tintColor: UIColor.white,
            corner: 5.0,
            image: nil
        )
    }
}
