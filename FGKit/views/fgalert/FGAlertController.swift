//
//  FGAlertView.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

public extension FGAlertAction {
    
    enum Style {
        case `default`
        case cancel
    }
}
public class FGAlertAction {
    
    var title: String?
    var style: FGAlertAction.Style?
    var handler: ((FGAlertAction) -> Void)?
    
    public init(title: String, style: FGAlertAction.Style, handler: ((FGAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}
public class FGAlertController: UIViewController {

    private var icon: UIImage?
    private var subtitle: String?
    private var message: String?

    //MARK: - IBOutlet
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var iconView: UIView!
    @IBOutlet private weak var blurView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!

    // MARK: - Init -
    public init(title: String?, message: String?, icon: UIImage? = nil) {
        self.icon = icon
        self.subtitle = title
        self.message = message
        
        super.init(nibName: "FGAlert", bundle: Bundle(for: type(of: self)))
        loadViewIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle -
    override open func viewDidLoad() {
        super.viewDidLoad()
        data()
    }
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Random -
    public func addAction(_ action: FGAlertAction) {
        buttonStackView.addArrangedSubview(setbutton(item: action))
        buttonStackView.isHidden = false
        styled()
    }
    
    private func data() {
        iconView.isHidden = (icon == nil)
        titleLabel.isHidden = (subtitle == nil)
        messageLabel.isHidden = (message == nil)

        titleLabel.text = subtitle
        messageLabel.text = message
        iconImage.image = icon
    }
    private func styled() {
        titleLabel.style(Styled.FGAlert.Title)
        messageLabel.style(Styled.FGAlert.Message)
        blurView.style(Styled.FGAlert.BGView)
        contentView.style(Styled.FGAlert.ContentView)
    }
    private func setbutton(item: FGAlertAction) -> UIButton {
        let button = UIButton()
        button.setTitle(item.title, for: .normal)
        button.style(item.style == .cancel ?
            Styled.FGAlert.DoneButton :
            Styled.FGAlert.ActionButton
        )
        button.action(for: .touchUpInside) { [unowned self] in
            self.dismiss(animated: true) {
                guard let done = item.handler else { return }
                done(item)
            }
        }
        return button
    }

    // MARK: - deinit -
    deinit {
        NotificationCenter.default.removeObserver("CloseAlertView")
        debugPrint("\(String(describing: self)) deinit")
    }
}
