//
//  PublishArticlePageViewController.swift
//  Midterm
//
//  Created by 林希語 on 2021/10/12.
//

import Foundation
import UIKit
import FirebaseFirestore

class PublishArticlePageViewController: UIViewController {
    
    let editView = UIView()
    var db: Firestore!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Publisher"
        editView.backgroundColor = .white
        setupEditView()
        setupInputTitleTextField()
        setupInputCategoryTextField()
        setupInputContentTextField()
        setupInputbutton()
        
        db = Firestore.firestore()
        
    }
    
    private func setupEditView() {
        editView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(editView)
        NSLayoutConstraint.activate([
            editView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1 / 2),
            editView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            editView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            editView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            editView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Properties
    
    lazy var inputTitleTextField: UITextField = {
        let inputTitleTextField = UITextField()
        inputTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTitleTextField.font = UIFont.systemFont(ofSize: 18)
        inputTitleTextField.textColor = .black
        inputTitleTextField.layer.borderColor = UIColor.lightGray.cgColor
        inputTitleTextField.layer.borderWidth = 1
        inputTitleTextField.placeholder = "input title"
        return inputTitleTextField
    }()
    
    lazy var inputCategoryTextField: UITextField = {
        let inputCategoryTextField = UITextField()
        inputCategoryTextField.translatesAutoresizingMaskIntoConstraints = false
        inputCategoryTextField.font = UIFont.systemFont(ofSize: 18)
        inputCategoryTextField.textColor = .black
        inputCategoryTextField.layer.borderColor = UIColor.lightGray.cgColor
        inputCategoryTextField.layer.borderWidth = 1
        inputCategoryTextField.placeholder = "input category"
        return inputCategoryTextField
    }()
    
    lazy var inputContentTextField: UITextField = {
        let inputContentTextField = UITextField()
        inputContentTextField.translatesAutoresizingMaskIntoConstraints = false
        inputContentTextField.font = UIFont.systemFont(ofSize: 18)
        inputContentTextField.textColor = .black
        inputContentTextField.layer.borderColor = UIColor.lightGray.cgColor
        inputContentTextField.layer.borderWidth = 1
        inputContentTextField.placeholder = "input content"
        return inputContentTextField
    }()
    
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(send), for: .touchUpInside)
        return button
    }()
    
    @objc func send() {
        addData()
        setupInputTitleTextField()
        navigationController?.popViewController(animated: true)
    }
    
    private func setupInputTitleTextField() {
        editView.addSubview(inputTitleTextField)
        NSLayoutConstraint.activate([
            inputTitleTextField.topAnchor.constraint(equalTo: editView.topAnchor, constant: 4),
            inputTitleTextField.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputTitleTextField.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            inputTitleTextField.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func setupInputCategoryTextField() {
        editView.addSubview(inputCategoryTextField)
        NSLayoutConstraint.activate([
            inputCategoryTextField.topAnchor.constraint(equalTo: inputTitleTextField.bottomAnchor, constant: 4),
            inputCategoryTextField.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputCategoryTextField.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            inputCategoryTextField.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func setupInputContentTextField() {
        editView.addSubview(inputContentTextField)
        NSLayoutConstraint.activate([
            inputContentTextField.topAnchor.constraint(equalTo: inputCategoryTextField.bottomAnchor, constant: 4),
            inputContentTextField.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputContentTextField.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4)
        ])
    }
    
    private func setupInputbutton() {
        editView.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: editView.bottomAnchor, constant: -4),
            button.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            button.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            button.topAnchor.constraint(equalTo: inputContentTextField.bottomAnchor, constant: 4),
            button.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.1)
        ])
    }
    
    func addData() {
    let articles = Firestore.firestore().collection("articles")
    let document = articles.document()
    let data: [String: Any] = [
    "email": "wayne@school.appworks.tw",
//    "id": "waynechen323",
    "name": "AKA小安老師",
    "title": "IU「亂穿」竟美出新境界！笑稱自己品味奇怪　網笑：靠顏值撐住女神氣場",
    "content": "南韓歌手IU（李知恩）無論在歌唱方面或是近期的戲劇作品都有亮眼的成績，但俗話說人無完美、美玉微瑕，曾再跟工作人員的互動影片中坦言自己品味很奇怪，近日在IG上分享了宛如「媽媽們青春時代的玉女歌手」超復古穿搭造型，卻意外美出新境界。",
    "createdTime": NSDate().timeIntervalSince1970,
    "id": document.documentID,
    "category": "Beauty"
    ]
    document.setData(data)
    }
    
    
}
