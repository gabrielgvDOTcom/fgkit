//
//  FormView.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FormView: UIViewController {
    
    //MARK: - VARs
    var presenter: FormProtocolPresenter?
    
    //MARK: - IBOutlet

    //MARK: - Init
    init() {
        super.init(nibName: "Form", bundle: nil)
        loadViewIfNeeded()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }

    //MARK: - Action´s Buttons
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }

    //MARK: - Functions
    //MARK: Random
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension FormView: FormProtocolView {
    
    func resume() {
        
    }
    func load(message: String?) {
        
    }
    func styled() {}
    func hideNavigation(hide: Bool) {
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
    }
    func moveKeyboard(inset: UIEdgeInsets) {
        //scrollView.contentInset = inset
    }
}
