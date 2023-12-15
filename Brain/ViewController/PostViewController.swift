//
//  PostView.swift
//  Practice
//
//  Created by Artem Poletaev on 30.03.2023.
//

import UIKit

class inBoxViewController: UIViewController{
    //MARK: - View
    
    
    private let name =  "Артем Полетаев"
    
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "IMG_0924")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()
    
    private lazy var nameTextFild: UITextField = {
        let textFild = UITextField()
        textFild.text = name
        textFild.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        textFild.textColor = .darkText
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()


    
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Мой пост"
        setup()
        configerationLayot()
    }
    
    private func setup(){
        self.view.addSubview(avatarImageView)
        self.view.addSubview(nameTextFild)
    }
    
    //MARK: - Constraint
    private func configerationLayot() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200),
            avatarImageView.widthAnchor.constraint(equalToConstant: 200),
            
            nameTextFild.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            nameTextFild.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }

    
}
