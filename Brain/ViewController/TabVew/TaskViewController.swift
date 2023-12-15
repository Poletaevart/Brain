//
//  TaskViewController.swift
//  Practice
//
//  Created by Artem Poletaev on 21.04.2023.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Создаем UITableView
    let tableView = UITableView()
    
    var data = [String]()
    
    private lazy var taskButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .bold)
        button.addTarget(self, action: #selector(self.addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.taskButton)
        self.navigationItem.title = "Сегодня"
        // Настройка UITableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        self.view.backgroundColor = .white
        // Регистрация ячейки, которую вы будете использовать
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Добавление UITableView на главный view
        view.addSubview(tableView)
        configerationLayot()
    }
    
    // MARK: - Constraint
    private func configerationLayot() {
        NSLayoutConstraint.activate([
            // Верхнее ограничение
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            // Нижнее ограничение
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            // Левое ограничение
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            // Правое ограничение
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            taskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40 ),
//            taskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            taskButton.heightAnchor.constraint(equalToConstant: 50),
//            taskButton.widthAnchor.constraint(equalToConstant: 50),
            // Правое ограничение
            taskButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),

                       // Ширина кнопки (квадратная)
            taskButton.widthAnchor.constraint(equalTo: taskButton.heightAnchor),

                       // Высота кнопки
            taskButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    // MARK: - UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    // MARK: - Button Action
    
    @objc func addButtonTapped() {
        // Создаем UIAlertController для ввода текста
        let alertController = UIAlertController(title: "Добавить задачу", message: nil, preferredStyle: .alert)
        
        // Добавляем поле для ввода текста
        alertController.addTextField { textField in
            textField.placeholder = "Введите текст"
        }
        
        // Добавляем кнопку "Готово"
        let doneAction = UIAlertAction(title: "Готово", style: .default) { _ in
            // Получаем введенный текст из текстового поля
            if let text = alertController.textFields?.first?.text, !text.isEmpty {
                // Добавляем текст в массив данных и обновляем таблицу
                self.data.append(text)
                self.tableView.reloadData()
            }
        }
        alertController.addAction(doneAction)
        
        // Добавляем кнопку "Отмена"
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Показываем UIAlertController
        present(alertController, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаление строки из массива данных и обновление таблицы
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
        
    }
}
