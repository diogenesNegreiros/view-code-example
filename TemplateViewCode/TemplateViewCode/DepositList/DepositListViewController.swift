//
//  DepositListViewController.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 15/06/21.
//

import UIKit

class DepositListViewController: MainViewController {

    private let customView = DepositListView()
    private var viewModel = DepositViewModel()
    
    init(viewModel: DepositViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = L10n.App.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
        
}
