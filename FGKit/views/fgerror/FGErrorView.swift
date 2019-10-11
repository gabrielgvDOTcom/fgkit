//
//  FGErrorView.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/29/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public protocol FGErrorDelegate: class {
    
    func retryOperation(errorView: FGErrorView) -> Void
}
open class FGErrorView: UIViewController {

    // MARK: - VARs -
    public var retry: Bool! {
        didSet { retryView.isHidden = !retry }
    }
    private unowned let delegate: FGErrorDelegate

    // MARK: - IBOutlet -
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var retryView: UIView!
    @IBOutlet private weak var retryLabel: UILabel!
    @IBOutlet private weak var retryIconImage: UIImageView!

    // MARK: - Init -
    public init(delegate: FGErrorDelegate) {
        self.delegate = delegate

        super.init(nibName: "FGError", bundle: Bundle(for: type(of: self)))
        loadViewIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        styled()
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Buttons -
    @IBAction func retryTapped(_ sender: UITapGestureRecognizer) {
        delegate.retryOperation(errorView: self)
    }

    // MARK: - Random -
    private func styled() {
        titleLabel.style(FGErrorStyled.shared().title)
        subtitleLabel.style(FGErrorStyled.shared().message)
        retryLabel.style(FGErrorStyled.shared().retry)
        retryIconImage.style(FGErrorStyled.shared().retryIcon)
    }
    public func remove() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            options: .allowUserInteraction,
            animations:{ [weak self] () -> Void in
                self?.view.alpha = 0
            }
        ) { [weak self] (completed) -> Void in
            self?.view.removeFromSuperview()
            //TODO: El controlador queda en memoria, hasta que se elimina desde navegación.
        }
    }
    public func present(_ title: String?, _ message: String?, content: UIView) {
        titleLabel.text = title ?? "Ha ocurrido un Error"
        subtitleLabel.text = message ?? "No se ha podido completar la operación por un error desconocido, inténtelo en un momento"
        
        FGLayout.fill(view: view, container: content)
        view.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1
        }
    }

    // MARK: - deinit -
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
