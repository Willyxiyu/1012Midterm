//
//  PublishArticlePageViewController.swift
//  Midterm
//
//  Created by 林希語 on 2021/10/12.
//

import Foundation
import UIKit

class PublishArticlePageViewController: UIViewController {
    
    let editView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Publisher"
        editView.backgroundColor = .white
        setupEditView()
        setupInputTitleLabel()
        setupInputCategoryLabel()
        setupInputContentLabel()
        setupInputbutton()
        
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
    
    lazy var inputTitleLabel: UILabel = {
        let inputTitleLabel = UILabel()
        inputTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputTitleLabel.font = UIFont.systemFont(ofSize: 18)
        inputTitleLabel.textColor = .black
        inputTitleLabel.layer.borderColor = UIColor.lightGray.cgColor
        inputTitleLabel.layer.borderWidth = 1
        return inputTitleLabel
    }()
    
    lazy var inputCategoryLabel: UILabel = {
        let inputCategoryLabel = UILabel()
        inputCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        inputCategoryLabel.font = UIFont.systemFont(ofSize: 18)
        inputCategoryLabel.textColor = .black
        inputCategoryLabel.layer.borderColor = UIColor.lightGray.cgColor
        inputCategoryLabel.layer.borderWidth = 1
        return inputCategoryLabel
    }()
    
    lazy var inputContentLabel: UILabel = {
        let inputContentLabel = UILabel()
        inputContentLabel.translatesAutoresizingMaskIntoConstraints = false
        inputContentLabel.font = UIFont.systemFont(ofSize: 18)
        inputContentLabel.textColor = .black
        inputContentLabel.layer.borderColor = UIColor.lightGray.cgColor
        inputContentLabel.layer.borderWidth = 1
        return inputContentLabel
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
        navigationController?.popViewController(animated: true)
    }
    
    private func setupInputTitleLabel() {
        editView.addSubview(inputTitleLabel)
        NSLayoutConstraint.activate([
            inputTitleLabel.topAnchor.constraint(equalTo: editView.topAnchor, constant: 4),
            inputTitleLabel.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputTitleLabel.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            inputTitleLabel.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func setupInputCategoryLabel() {
        editView.addSubview(inputCategoryLabel)
        NSLayoutConstraint.activate([
            inputCategoryLabel.topAnchor.constraint(equalTo: inputTitleLabel.bottomAnchor, constant: 4),
            inputCategoryLabel.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputCategoryLabel.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            inputCategoryLabel.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.08)
        ])
    }
    
    private func setupInputContentLabel() {
        editView.addSubview(inputContentLabel)
        NSLayoutConstraint.activate([
            inputContentLabel.topAnchor.constraint(equalTo: inputCategoryLabel.bottomAnchor, constant: 4),
            inputContentLabel.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            inputContentLabel.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4)
        ])
    }
    
    private func setupInputbutton() {
        editView.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: editView.bottomAnchor, constant: -4),
            button.leadingAnchor.constraint(equalTo: editView.leadingAnchor, constant: 4),
            button.trailingAnchor.constraint(equalTo: editView.trailingAnchor, constant: -4),
            button.topAnchor.constraint(equalTo: inputContentLabel.bottomAnchor, constant: 4),
            button.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 0.1)
        ])
    }
    
}
