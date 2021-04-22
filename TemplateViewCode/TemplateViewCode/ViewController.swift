//
//  ViewController.swift
//  TemplateViewCode
//
//  Created by Diogenes de Souza on 27/02/21.
//

import UIKit

protocol ViewCodeConfiguration {
    func buildHierachy()
    func setupConstrainsts()
    func configureView()
}

extension ViewCodeConfiguration{
    func configureView(){
        
    }
    func aplyViewCode(){
        buildHierachy()
        setupConstrainsts()
        configureView()
        
    }
    
}

class ViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {return UIImageView(frame: .zero)}()
    private lazy var labelNick: UILabel = {return UILabel(frame: .zero)}()
    private lazy var labelPassWord: UILabel = {return UILabel(frame: .zero)}()
    private lazy var fieldNick: UITextField = {return UITextField(frame: .zero)}()
    private lazy var fieldPassWord: UITextField = {return UITextField(frame: .zero)}()
    
    private lazy var buttonOk = {return UIButton(frame: .zero)}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exemplo com View Code"
        aplyViewCode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func logar(){
        print("Clicou no botão logar!")
    }
    
}

extension ViewController: ViewCodeConfiguration{
    
    func buildHierachy() {
        view.addSubview(imageView)
        view.addSubview(labelNick)
        view.addSubview(fieldNick)
        view.addSubview(labelPassWord)
        view.addSubview(fieldPassWord)
        view.addSubview(buttonOk)
        
        let arraySubViews = [imageView,labelNick,fieldNick,labelPassWord,fieldPassWord,buttonOk]
        arraySubViews.forEach{ view in view.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    
    func setupConstrainsts() {
        
        let constraints = [
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant:80),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            
            labelNick.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:20),
            labelNick.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            labelNick.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            labelNick.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant:15),
            
            fieldNick.leadingAnchor.constraint(equalTo: labelNick.leadingAnchor),
            fieldNick.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            fieldNick.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            fieldNick.topAnchor.constraint(equalTo: labelNick.bottomAnchor,constant:10),
            
            
            labelPassWord.leadingAnchor.constraint(equalTo: fieldNick.leadingAnchor),
            labelPassWord.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            labelPassWord.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            labelPassWord.topAnchor.constraint(equalTo: fieldNick.bottomAnchor,constant:15),
            
            fieldPassWord.leadingAnchor.constraint(equalTo: labelPassWord.leadingAnchor),
            fieldPassWord.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            fieldPassWord.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            fieldPassWord.topAnchor.constraint(equalTo: labelPassWord.bottomAnchor,constant:10),
            
            
            buttonOk.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonOk.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            buttonOk.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
            buttonOk.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-30)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    func configureView(){
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "imgSwift")
        
        labelNick.text = "Nick Name"
        
        fieldNick.backgroundColor = .white
        fieldNick.layer.borderWidth = 1
        fieldNick.layer.borderColor = UIColor.gray.cgColor
        fieldNick.layer.cornerRadius = 8
        fieldNick.placeholder = "Digite o seu nick Name"
        fieldNick.textAlignment = .center
        fieldNick.keyboardType = .default
        
        labelPassWord.text = "Password"
        
        fieldNick.backgroundColor = .white
        fieldNick.layer.borderWidth = 1
        fieldNick.layer.borderColor = UIColor.gray.cgColor
        fieldNick.layer.cornerRadius = 8
        fieldNick.placeholder = "Digite o seu nick Name"
        fieldNick.textAlignment = .center
        fieldNick.keyboardType = .default
        
        fieldPassWord.backgroundColor = .white
        fieldPassWord.layer.borderWidth = 1
        fieldPassWord.layer.borderColor = UIColor.gray.cgColor
        fieldPassWord.layer.cornerRadius = 8
        fieldPassWord.placeholder = "Digite sua senha"
        fieldPassWord.textAlignment = .center
        fieldPassWord.keyboardType = .numberPad
        fieldPassWord.isSecureTextEntry = true
        
        buttonOk.setTitle("OK", for: .normal)
        buttonOk.backgroundColor = .systemOrange
        buttonOk.setTitleColor(.white, for: .normal)
        buttonOk.setTitleColor(.lightGray, for: .highlighted)
        buttonOk.addTarget(self, action: #selector(self.logar), for: .touchUpInside)
        buttonOk.layer.cornerRadius = 5
        
        
    }
    
    
}

