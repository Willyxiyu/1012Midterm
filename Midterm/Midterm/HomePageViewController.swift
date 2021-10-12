//
//  ViewController.swift
//  Midterm
//
//  Created by 林希語 on 2021/10/12.
//

import UIKit
import FirebaseFirestore


class HomePageViewController: UIViewController {
    
    let tableView = UITableView()
    let publishArticlePageViewController = PublishArticlePageViewController()
    
    var db: Firestore!
    var publishArticleList = [[String: Any]]()
    var articleTitle: [String] = []
    var authorName: [String] = []
    var createdTime: [Int] = []
    var content: [String] = []
    var category: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        self.view.backgroundColor = .white
        title = "Publisher"
        setUpTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        setupPublishArticlePageButton()
        
//        getPublishArticleList { articleTitle, authorName, createdTime, content, category in
//            self.articleTitle.append(articleTitle)
//
//
//
//        }
        
        
        tableView.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    
    lazy var publishArticlePageButton: UIButton = {
        let publishArticlePageButton = UIButton(type: .custom)
        publishArticlePageButton.translatesAutoresizingMaskIntoConstraints = false
        publishArticlePageButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        publishArticlePageButton.tintColor = .purple
        publishArticlePageButton.setTitle("+", for: .normal)
        publishArticlePageButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        publishArticlePageButton.contentVerticalAlignment = .center
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
            publishArticlePageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            publishArticlePageButton.heightAnchor.constraint(equalToConstant: 60),
            publishArticlePageButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        
    }
    
    func getPublishArticleList(handler: @escaping ([String], [String], [Int], [String], [String]) -> Void) {
        let ref = db.collection("articles")
        ref.whereField("name", isEqualTo: "AKA小安老師")
            .getDocuments { snapshot, error in
                
                var articleTitle: [String] = []
                var authorName: [String] = []
                var createdTime: [Int] = []
                var content: [String] = []
                var category: [String] = []
                
                guard let snapshot = snapshot else { return }
                let publishArticleList = snapshot.documents
                publishArticleList.forEach { snapshot in
                    snapshot.data()
                    articleTitle.append(snapshot.data()["title"] as? String ?? "")
                    authorName.append(snapshot.data()["name"] as? String ?? "")
                    createdTime.append(snapshot.data()["createdTime"] as? Int ?? 0)
                    content.append(snapshot.data()["content"] as? String ?? "")
                    category.append(snapshot.data()["category"] as? String ?? "")
                    handler(articleTitle, authorName, createdTime, content, category)
                }
                
            }
        
    }
    
   
}
extension HomePageViewController: UITableViewDelegate {
    
}

extension HomePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articleTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "\(TableViewCell.self)"), for: indexPath) as? TableViewCell else { fatalError("Error") }
        
        cell.categoryLabel.text = category[indexPath.row]
        cell.nameLabel.text = authorName[indexPath.row]
        cell.titleLabel.text = articleTitle[indexPath.row]
        cell.contentLabel.text = content[indexPath.row]
        cell.timeLabel.text = String("\(createdTime[indexPath.row])")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

