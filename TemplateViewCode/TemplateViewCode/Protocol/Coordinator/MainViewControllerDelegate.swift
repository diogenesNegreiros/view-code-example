//
//  MainCoordinatorDelegate.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 15/06/21.
//

import Foundation
import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func didMoveFromNavigationStack(_ viewController: UIViewController)
}
