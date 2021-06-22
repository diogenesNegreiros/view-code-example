//
//  UIViewExtension.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 21/06/21.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]){
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
}
