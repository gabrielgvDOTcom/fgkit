//
//  FGAlertView.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

open class FGAlertView: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var iconView: UIView!
    @IBOutlet private weak var blurView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var buttonStackViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Init -
    public init() {
        super.init(nibName: "FGAlert", bundle: Bundle(for: type(of: self)))
        loadViewIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle -
    override open func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.style(Styled.FGAlert.Title)
        messageLabel.style(Styled.FGAlert.Message)
        blurView.style(Styled.FGAlert.BGView)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(removeView(_:)),
            name: NSNotification.Name(rawValue: "CloseAlertView"),
            object: nil
        )
    }
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Random -
    func action(objects: [FGAlertAction]) {
        guard !objects.isEmpty else { return }
        objects.forEach({ item in
            if let button = item.button { buttonStackView.addArrangedSubview(button) }
        })
        buttonStackView.isHidden = false
    }
    func data(title: String?, message: String?, icon: UIImage? = nil) {
        iconView.isHidden = (icon == nil)
        titleLabel.isHidden = (title == nil)
        messageLabel.isHidden = (message == nil)

        titleLabel.text = title
        messageLabel.text = message
        iconImage.image = icon

        contentView.style(Styled.FGAlert.ContentView)
    }
    
    // MARK: - Notification -
    @objc private func removeView(_ notification: Notification) {
        guard let done = notification.userInfo?["done"] as? (() -> Void) else {
            return self.dismiss(animated: true, completion: nil)
        }
        self.dismiss(animated: true) { done() }
    }

    // MARK: - deinit -
    deinit {
        NotificationCenter.default.removeObserver("CloseAlertView")
        debugLog("\(String(describing: self)) deinit")
    }
}
