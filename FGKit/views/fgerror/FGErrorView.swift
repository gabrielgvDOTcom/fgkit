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
    }
    public func present(_ title: String?, _ message: String?, view: UIView) {
        titleLabel.text = title ?? "Ha ocurrido un Error"
        subtitleLabel.text = message ?? "No se ha podido completar la operación por un error desconocido, inténtelo en un momento"
        FGLayout.fill(view: self.view, container: view)
    }

    // MARK: - deinit -
    deinit {
        debugLog("\(String(describing: self)) deinit")
        retry = nil
        view = nil
    }
}
