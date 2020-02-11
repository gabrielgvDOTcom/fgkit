//
//  FGAlertEntity.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import Foundation

@objc public enum FGAlertHandler: Int32 {

    case action = 1
    case done = 2
}
open class FGAlert {

    // MARK: - IBOutlet -
    var icon: UIImage?
    var title: String?
    var message: String?
    var actions: [FGAlertAction] = []
    private var alert: FGAlertView?

    // MARK: - Init -
    public init(title: String?, message: String?, icon: UIImage? = nil) {
        self.title = title
        self.message = message
        self.icon = icon
        self.alert = FGAlertView()
    }

    // MARK: - Functions -
    public func present(container: UIViewController) {
        if let controller = alert, (controller.presentingViewController == nil) {
            controller.action(objects: actions)
            controller.modalPresentationStyle = .overCurrentContext
            controller.data(title: title, message: message, icon: icon)
            container.navigationController?.present(controller, animated: true, completion: nil)
        }
    }
    public func addAction(_ object: FGAlertAction) {
        actions.append(object)
    }
}
open class FGAlertAction {

    // MARK: - IBOutlet -
    var title: String?
    var button: UIButton?
    var handler: FGAlertHandler?
    var action: (() -> Void)?
    
    // MARK: - Init -
    public init(title: String, handler: FGAlertHandler, _ completion: (() -> Void)? = nil) {
        self.title = title
        self.handler = handler
        self.action = completion
        self.button = setbutton()
    }
    
    // MARK: - Functions -
    private func setbutton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.style(handler == .done ?
            Styled.FGAlert.DoneButton :
            Styled.FGAlert.ActionButton
        )
        button.action(for: .touchUpInside) { [weak self] in
            DispatchQueue.main.async {
                if let done = self?.action { done() }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CloseAlertView"), object: nil)
            }
        }
        return button
    }
}
