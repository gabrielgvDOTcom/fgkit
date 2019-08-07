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
    
    //MARK: - IBOutlet
    @IBOutlet weak var versionLabel: UILabel!

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
    
    //MARK: - Functions
    //MARK: Random
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension MenuView: MenuProtocolView {
    
    //MARK: - Functions
    //MARK: Data
    
    //MARK: Random
    func resume() {
        
    }
    func load(message: String?) {
        
    }

    func styled() {}
    func hideNavigation(hide: Bool) {
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
    }
}
