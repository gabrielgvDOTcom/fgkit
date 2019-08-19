//
//  MenuView.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class MenuView: UIViewController {
    
    //MARK: - VARs
    var presenter: MenuProtocolPresenter?
    
    //MARK: - Init
    init() {
        super.init(nibName: "Menu", bundle: nil)
        loadViewIfNeeded()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    //MARK: - IBOutlet

    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func pushToFormController(_ sender: UIButton) {
        presenter?.pushToRunController()
    }
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
extension MenuView: MenuProtocolView {
    
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
