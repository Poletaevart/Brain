//
//  CenterViewController.swift
//  Practice
//
//  Created by Artem Poletaev on 30.03.2023.
//

import UIKit


class CenterViewController: UIViewController{
    //MARK: - View
    
    private lazy var inBoxImage: UIImageView = {
        let inBoxImage = UIImageView()
        inBoxImage.image = UIImage(systemName: "tray")
        inBoxImage.translatesAutoresizingMaskIntoConstraints = false
        return inBoxImage
    }()
    private lazy var todayImage: UIImageView = {
        let todayImage = UIImageView()
        todayImage.image = UIImage(systemName: "tray")
        todayImage.translatesAutoresizingMaskIntoConstraints = false
        return todayImage
    }()
    private lazy var tomorrowImage: UIImageView = {
        let tomorrowImage = UIImageView()
        tomorrowImage.image = UIImage(systemName: "tray")
        tomorrowImage.translatesAutoresizingMaskIntoConstraints = false
        return tomorrowImage
    }()
    private lazy var postButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Входящие", for: .normal)
        button.setTitleColor(.black, for: .normal)
       
        button.addTarget(self, action: #selector(self.tapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сегодня", for: .normal)
        button.setTitleColor(.black, for: .normal)
                button.addTarget(self, action: #selector(self.tableTapButton), for: .touchUpInside)
        return button
    }()
    private lazy var colectionButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Корзина", for: .normal)
        button.setTitleColor(.black, for: .normal)

        button.addTarget(self, action: #selector(self.colectionTapButton), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Меню"
        setup()
        configerationLayot()
    }
    private func setup(){
        self.view.addSubview(inBoxImage)
        self.view.addSubview(todayImage)
        self.view.addSubview(tomorrowImage)
        self.view.addSubview(postButton)
        self.view.addSubview(tableButton)
        self.view.addSubview(colectionButton)
        
    }
    
    //MARK: - objc
    @objc private func tapButton() {
        let postview = inBoxViewController()
        self.navigationController?.pushViewController(postview, animated: true)
        print("🍏")
    }
   
    @objc private func tableTapButton() {
        let tabletview = TaskViewController()
        self.navigationController?.pushViewController(tabletview, animated: true)
        print("📱")
    }
    @objc private func colectionTapButton() {
        let colectionview = ColectionViewController()
        self.navigationController?.pushViewController(colectionview, animated: true)
        print("🔥")
    }
    
    //MARK: - Constraint
    private func configerationLayot() {
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25),
            postButton.trailingAnchor.constraint(equalTo: inBoxImage.trailingAnchor, constant: 100),
            postButton.heightAnchor.constraint(equalToConstant: 20),
            postButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            tableButton.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 25),
            tableButton.trailingAnchor.constraint(equalTo: todayImage.trailingAnchor, constant: 93),
            tableButton.heightAnchor.constraint(equalToConstant: 20),
            tableButton.widthAnchor.constraint(equalToConstant: 100),
            
            colectionButton.topAnchor.constraint(equalTo: tableButton.bottomAnchor, constant: 25),
            colectionButton.trailingAnchor.constraint(equalTo: inBoxImage.trailingAnchor, constant: 93),
            colectionButton.heightAnchor.constraint(equalToConstant: 20),
            colectionButton.widthAnchor.constraint(equalToConstant: 100),
            
            inBoxImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25),
            inBoxImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 25),
            inBoxImage.heightAnchor.constraint(equalToConstant: 20),
            
            todayImage.topAnchor.constraint(equalTo: inBoxImage.bottomAnchor,constant: 25),
            todayImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 25),
            todayImage.heightAnchor.constraint(equalToConstant: 20),
            
            tomorrowImage.topAnchor.constraint(equalTo: todayImage.bottomAnchor,constant: 25),
            tomorrowImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 25),
            tomorrowImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

}
