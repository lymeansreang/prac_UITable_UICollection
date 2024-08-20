//
//  HomeViewController.swift
//  ReanTable
//
//  Created by Rithiya on 16/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomePostCell.self, forCellReuseIdentifier: "HomePostCell")
        tableView.register(HomeStoryCell.self, forCellReuseIdentifier: "HomeStoryCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    

    private var posts: [PostModel] = [
        PostModel(profile: "profile1", name: "Dara", hour: "2h", description: "Lorem Ipsum text is commonly used as placeholder text in design and typesetting to fill in spaces and demonstrate the layout of a document or a web page. ", imagePosting: "posting1", emojiLike: "likeEmoji", emojiLove: "loveEmoji", emojiHappy: "happyEmoji", totalLike: "100K+",commentAmount: "10K comments", shareAmount: "999 shares"),
        PostModel(profile: "profile2", name: "Bopha", hour: "1h", description: "Are you looking for [describe the benefit or unique selling point of the position/item/event]? Look no further! We are thrilled to present [Company/Organization/Event Name], where [briefly describe what the company/organization/event does or offers].", imagePosting: "posting2", emojiLike: "likeEmoji", emojiLove: "loveEmoji", emojiHappy: "happyEmoji", totalLike: "200K+", commentAmount: "20K comments", shareAmount: "168 shares"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        
        navigationItem.title = "Muk Seavphov"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(didTapButton))
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row != 0 else {
            return 150
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeStoryCell", for: indexPath) as! HomeStoryCell
            return cell
        }
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePostCell", for: indexPath) as! HomePostCell
        let post = posts[indexPath.row - 1]
        cell.profileImageView.image = UIImage(named: post.profile)
        cell.nameLabel.text = post.name
        cell.hourLabel.text = post.hour
        cell.descriptionLabel.text = post.description
        cell.postingImage.image = UIImage(named: post.imagePosting)
        cell.likeEmojiImage.image = UIImage(named: post.emojiLike)
        cell.heartEmojiImage.image = UIImage(named: post.emojiLove)
        cell.happyEmojiImage.image = UIImage(named: post.emojiHappy)
        cell.totalLikeLabel.text = post.totalLike
        cell.commentLabel.text = post.commentAmount
        cell.shareLabel.text = post.shareAmount
        return cell
    }
    
    
}


