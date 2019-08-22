//
//  NibDesignable.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public protocol NibDesignableProtocol: NSObjectProtocol {
    
    var nibContainerView: UIView { get }
    func loadNib() -> UIView
    func nibName() -> String
}

public extension NibDesignableProtocol {
    
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    fileprivate func setupNib() {
        let view = self.loadNib()
        self.nibContainerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:nil, views: bindings))
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:nil, views: bindings))
    }
}

public extension UIView {
    
    @objc public var nibContainerView: UIView {
        get {
            return self
        }
    }
    public func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}

@IBDesignable
open class NibDesignable: UIView, NibDesignableProtocol {
    
    convenience public init() {
        self.init()
        self.setupNib()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
open class NibDesignableTableViewCell: UITableViewCell, NibDesignableProtocol {
    
    open override var nibContainerView: UIView {
        get {
            return self.contentView
        }
    }
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupNib()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
open class NibDesignableControl: UIControl, NibDesignableProtocol {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
open class NibDesignableCollectionViewCell: UICollectionViewCell, NibDesignableProtocol {
    
    open override var nibContainerView: UIView {
        get {
            return self.contentView
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}
