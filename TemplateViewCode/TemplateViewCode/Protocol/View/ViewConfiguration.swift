//
//  ViewConfiguration.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 14/06/21.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
