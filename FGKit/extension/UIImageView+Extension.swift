//
//  UIImageView+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 9/9/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Kingfisher

public extension UIImageView {
    
    func remote(_ source: URL?, _ placeholder: UIImage?, cornerRadius: CGFloat) {
        let processor = DownsamplingImageProcessor(size: self.frame.size)
            >> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: source,
            placeholder: placeholder,
            options: [.processor(processor), .transition(.fade(1)), .cacheOriginalImage]
        ) {
            result in
            switch result {
            case .success(let value):
                debugLog("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                debugLog("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
