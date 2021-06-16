//
//  MainViewController.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 15/06/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    // MARK: Internal Properties

    internal let backButton = UIBarButtonItem(image: Assets.swift.image, style: .plain, target: nil, action: nil)

    // MARK: - Public properties
    
    weak var delegate: MainViewControllerDelegate?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension MainViewController: UINavigationControllerDelegate {
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent == nil {
            delegate?.didMoveFromNavigationStack(self)
        }
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        delegate?.didMoveFromNavigationStack(self)
    }
}

// MARK: - Public methods

extension MainViewController {
    
    func popViewControllerStack(animated: Bool) {
        
        if navigationController?.viewControllers.first === self {
            navigationController?.setViewControllers([], animated: animated)
        } else {
            navigationController?.popToViewController(self, animated: false)
            navigationController?.popViewController(animated: animated)
        }
    }

    func setupDefaultBackButton() {
        navigationItem.leftBarButtonItem = backButton
        navigationController?.navigationBar.backItem?.title = " "
    }
}
