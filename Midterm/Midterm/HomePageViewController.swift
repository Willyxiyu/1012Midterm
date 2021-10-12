//
//  ViewController.swift
//  Midterm
//
//  Created by 林希語 on 2021/10/12.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let tableView = UITableView()
    let publishArticlePageViewController = PublishArticlePageViewController()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "Publisher"
        setUpTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        setupPublishArticlePageButton()
        
        // Do any additional setup after loading the view.
    }
    
    lazy var publishArticlePageButton: UIButton = {
        let publishArticlePageButton = UIButton(type: .custom)
        publishArticlePageButton.translatesAutoresizingMaskIntoConstraints = false
        publishArticlePageButton.setImage(UIImage(systemName: "add"), for: .normal)
        publishArticlePageButton.setTitle("+", for: .normal)
        publishArticlePageButton.backgroundColor = .purple
//        publishArticlePageButton.layer.cornerRadius 
        publishArticlePageButton.isEnabled = true
        publishArticlePageButton.addTarget(self, action: #selector(addNewArticle), for: .touchUpInside)
        return publishArticlePageButton
    }()
    
    
    @objc private func addNewArticle() {
        navigationController?.pushViewController(publishArticlePageViewController, animated: true)
    }


    private func setUpTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupPublishArticlePageButton() {
        self.view.addSubview(publishArticlePageButton)
        NSLayoutConstraint.activate([
            publishArticlePageButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            publishArticlePageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        
    }
    
}

extension HomePageViewController: UITableViewDelegate {
    
}

extension HomePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "\(TableViewCell.self)"), for: indexPath) as? TableViewCell else { fatalError("Error") }
        
        cell.categoryLabel.text = "category"
        cell.nameLabel.text = "name"
        cell.titleLabel.text = "title"
        cell.contentLabel.text = "content"
        cell.timeLabel.text = "time"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}

