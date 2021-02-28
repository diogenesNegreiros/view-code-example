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
       print("Iniciou ViewController")
        title = "Exemplo com View Code"
        aplyViewCode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func logar(){
        print("Clicou no botão logar!")
    }
    
//    override func loadView() {
//        let view = UIView(frame: UIScreen.main.bounds)
//        view.backgroundColor = .white
//        self.view = view
//        title = "Example View code"
//    }


}

extension ViewController: ViewCodeConfiguration{
    func buildHierachy() {
        view.addSubview(imageView)
        view.addSubview(labelNick)
        view.addSubview(fieldNick)
        view.addSubview(labelPassWord)
        view.addSubview(fieldPassWord)
        view.addSubview(buttonOk)
       
    }
    
    func setupConstrainsts() {
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant:80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        labelNick.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:20).isActive = true
        labelNick.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        labelNick.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        labelNick.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant:15).isActive = true
        
        fieldNick.leadingAnchor.constraint(equalTo: labelNick.leadingAnchor).isActive = true
        fieldNick.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        fieldNick.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        fieldNick.topAnchor.constraint(equalTo: labelNick.bottomAnchor,constant:10).isActive = true
        
        
        labelPassWord.leadingAnchor.constraint(equalTo: fieldNick.leadingAnchor).isActive = true
        labelPassWord.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        labelPassWord.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        labelPassWord.topAnchor.constraint(equalTo: fieldNick.bottomAnchor,constant:15).isActive = true
        
        fieldPassWord.leadingAnchor.constraint(equalTo: labelPassWord.leadingAnchor).isActive = true
        fieldPassWord.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        fieldPassWord.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        fieldPassWord.topAnchor.constraint(equalTo: labelPassWord.bottomAnchor,constant:10).isActive = true
        
        buttonOk.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonOk.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20).isActive = true
        buttonOk.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        buttonOk.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-30).isActive = true
        
        
     
       
    }
    
    func configureView(){
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "imgSwift")
        imageView.translatesAutoresizingMaskIntoConstraints = false //não segue as leis do auto Layout
        
        labelNick.text = "Nick Name"
        labelNick.translatesAutoresizingMaskIntoConstraints = false
        
        fieldNick.backgroundColor = .white
        fieldNick.layer.borderWidth = 1
        fieldNick.layer.borderColor = UIColor.gray.cgColor
        fieldNick.layer.cornerRadius = 8
        fieldNick.placeholder = "Digite o seu nick Name"
        fieldNick.textAlignment = .center
        fieldNick.keyboardType = .default
        fieldNick.translatesAutoresizingMaskIntoConstraints = false
        
        labelPassWord.text = "Password"
        labelPassWord.translatesAutoresizingMaskIntoConstraints = false
        
        fieldNick.backgroundColor = .white
        fieldNick.layer.borderWidth = 1
        fieldNick.layer.borderColor = UIColor.gray.cgColor
        fieldNick.layer.cornerRadius = 8
        fieldNick.placeholder = "Digite o seu nick Name"
        fieldNick.textAlignment = .center
        fieldNick.keyboardType = .default
        fieldNick.translatesAutoresizingMaskIntoConstraints = false
        
        fieldPassWord.backgroundColor = .white
        fieldPassWord.layer.borderWidth = 1
        fieldPassWord.layer.borderColor = UIColor.gray.cgColor
        fieldPassWord.layer.cornerRadius = 8
        fieldPassWord.placeholder = "Digite sua senha"
        fieldPassWord.textAlignment = .center
        fieldPassWord.keyboardType = .numberPad
        fieldPassWord.isSecureTextEntry = true
        fieldPassWord.translatesAutoresizingMaskIntoConstraints = false
        
        buttonOk.setTitle("OK", for: .normal)
        buttonOk.backgroundColor = .systemOrange
        buttonOk.setTitleColor(.white, for: .normal)
        buttonOk.setTitleColor(.lightGray, for: .highlighted)
        buttonOk.addTarget(self, action: #selector(self.logar), for: .touchUpInside)
        buttonOk.layer.cornerRadius = 5
        buttonOk.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
}

