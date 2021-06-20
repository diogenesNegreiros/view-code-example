//
//  LoginView.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 14/06/21.
//

import UIKit

class LoginView: UIView {
    
    let userName: UILabel = {
        let user = UILabel(frame: .zero)
        user.text = "Faça o login!"
        return user
    }()
    
    let indicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(frame: .zero)
        loading.color = .orange
        return loading
    }()
    
    let imageView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = Assets.swift.image
        return img
    }()
    
    lazy var labelNick: UILabel = {return UILabel(frame: .zero)}()
    lazy var labelPassWord: UILabel = {return UILabel(frame: .zero)}()
    lazy var fieldNick: UITextField = {return UITextField(frame: .zero)}()
    lazy var fieldPassWord: UITextField = {return UITextField(frame: .zero)}()
    
    lazy var buttonOk = {return UIButton(frame: .zero)}()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(userName)
        addSubview(imageView)
        addSubview(labelNick)
        addSubview(fieldNick)
        addSubview(labelPassWord)
        addSubview(fieldPassWord)
        addSubview(buttonOk)
        addSubview(indicator)
        
        let arraySubViews = [userName,imageView,labelNick,fieldNick,labelPassWord,fieldPassWord,buttonOk,indicator]
        arraySubViews.forEach{ view in view.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func setupConstraints() {
        
        let constraints = [
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            userName.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:20),
            imageView.topAnchor.constraint(equalTo: userName.bottomAnchor,constant:20),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:20),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            labelNick.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:20),
            labelNick.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            labelNick.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            labelNick.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant:15),
            
            fieldNick.leadingAnchor.constraint(equalTo: labelNick.leadingAnchor),
            fieldNick.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            fieldNick.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            fieldNick.topAnchor.constraint(equalTo: labelNick.bottomAnchor,constant:10),
            
            labelPassWord.leadingAnchor.constraint(equalTo: fieldNick.leadingAnchor),
            labelPassWord.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            labelPassWord.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            labelPassWord.topAnchor.constraint(equalTo: fieldNick.bottomAnchor,constant:15),
            
            fieldPassWord.leadingAnchor.constraint(equalTo: labelPassWord.leadingAnchor),
            fieldPassWord.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            fieldPassWord.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            fieldPassWord.topAnchor.constraint(equalTo: labelPassWord.bottomAnchor,constant:10),
            
            buttonOk.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonOk.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-20),
            buttonOk.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            buttonOk.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-30),
            
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews(){
        userName.textColor = .orange
        imageView.contentMode = .scaleAspectFit
        labelNick.text = L10n.Form.name
        fieldNick.backgroundColor = .white
        fieldNick.layer.borderWidth = 1
        fieldNick.layer.borderColor = UIColor.gray.cgColor
        fieldNick.layer.cornerRadius = 8
        fieldNick.placeholder = L10n.Form.Placeholder.name
        fieldNick.textAlignment = .center
        fieldNick.keyboardType = .default
        labelPassWord.text = L10n.Form.password
        fieldPassWord.backgroundColor = .white
        fieldPassWord.layer.borderWidth = 1
        fieldPassWord.layer.borderColor = UIColor.gray.cgColor
        fieldPassWord.layer.cornerRadius = 8
        fieldPassWord.placeholder = L10n.Form.Placeholder.password
        fieldPassWord.textAlignment = .center
        fieldPassWord.keyboardType = .numberPad
        fieldPassWord.isSecureTextEntry = true
        buttonOk.setTitle("OK", for: .normal)
        buttonOk.backgroundColor = Assets.Colors.amber.color
        buttonOk.setTitleColor(.white, for: .normal)
        buttonOk.setTitleColor(.lightGray, for: .highlighted)
        buttonOk.layer.cornerRadius = 5
    }
}
