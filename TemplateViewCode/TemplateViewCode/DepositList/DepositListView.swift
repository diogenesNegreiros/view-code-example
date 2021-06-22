//
//  DepositListView.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 15/06/21.
//

import Foundation
import UIKit

class DepositListView: UIView {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .white
        return table
    }()
    
    let header: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .orange
        return view
    }()
    
    let title: UILabel = {
        let textLb = UILabel(frame: .zero)
        textLb.text = "Minha Lista"
        textLb.textColor = .white
        textLb.backgroundColor = .orange
        textLb.font = UIFont.systemFont(ofSize: 30)
        textLb.translatesAutoresizingMaskIntoConstraints = false
        return textLb
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DepositListView: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        header.addSubview(title)
addSubviews([tableView, header])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: leadingAnchor),
            header.topAnchor.constraint(equalTo: topAnchor),
            header.trailingAnchor.constraint(equalTo: trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 100),
            title.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

