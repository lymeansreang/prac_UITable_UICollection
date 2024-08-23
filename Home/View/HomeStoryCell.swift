//
//  HomeStoryCell.swift
//  ReanTable
//
//  Created by Rithiya on 20/8/24.
//

import UIKit

class HomeStoryCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 1.7) - (10 * 9), height: 230)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeStoryCollectionViewCell.self, forCellWithReuseIdentifier: "HomeStoryCollectionViewCell")
        collectionView.register(HomeStoryAddPostCollectionViewCell.self, forCellWithReuseIdentifier: "HomeStoryAddPostCollectionViewCell")
        return collectionView
    }()
    
    private var postStories : [PostStoryModel] = [
        PostStoryModel(profile: "profile3")
    ]
    
    private var userPostStories : [userStoryModel] = [
        userStoryModel(profile: "profile4", name: "Sok Sao", photo: "story1"),
        userStoryModel(profile: "profile1", name: "John Deo", photo: "story2"),
        userStoryModel(profile: "profile4", name: "Sok Sao", photo: "story1"),
        userStoryModel(profile: "profile1", name: "John Deo", photo: "story2"),
        userStoryModel(profile: "profile4", name: "Sok Sao", photo: "story1"),
        userStoryModel(profile: "profile1", name: "John Deo", photo: "story2"),
        userStoryModel(profile: "profile4", name: "Sok Sao", photo: "story1"),
        userStoryModel(profile: "profile1", name: "John Deo", photo: "story2"),
        userStoryModel(profile: "profile4", name: "Sok Sao", photo: "story1"),
        userStoryModel(profile: "profile1", name: "John Deo", photo: "story2"),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    

}

extension HomeStoryCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPostStories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoryAddPostCollectionViewCell", for: indexPath) as! HomeStoryAddPostCollectionViewCell
            let postStory = postStories[indexPath.row]
            cell.profileImage.image = UIImage(named: postStory.profile)
            return cell
        }
        
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoryCollectionViewCell", for: indexPath) as! HomeStoryCollectionViewCell
            var userPostStory = userPostStories[indexPath.row]
            cell.profileImage.image = UIImage(named: userPostStory.profile)
            cell.storyPostImage.image = UIImage(named: userPostStory.photo)
            cell.usernameLabel.text = userPostStory.name
            return cell
        
        
    }
}
    
    class HomeStoryAddPostCollectionViewCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .systemGray6
            contentView.layer.cornerRadius = 15
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView (){
            contentView.addSubview(profileImage)
            contentView.addSubview(createPostButton)
            contentView.addSubview(createLabal)
            
            NSLayoutConstraint.activate([
                profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                profileImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -50),
                profileImage.heightAnchor.constraint(equalToConstant: 20),
                profileImage.widthAnchor.constraint(equalToConstant: 120),
                
                createPostButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
                createPostButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
                createPostButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 160),
                createPostButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
                createPostButton.heightAnchor.constraint(equalToConstant: 40),
                createPostButton.widthAnchor.constraint(equalToConstant: 30),
                
                createLabal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                createLabal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                createLabal.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        }
        
        public let profileImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 15
            image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            image.translatesAutoresizingMaskIntoConstraints = false
            image.clipsToBounds = true
            return image
        }()
        
        public let createPostButton : UIButton = {
            let button = UIButton()
            button.layer.borderWidth = 3
            button.layer.cornerRadius = 20
            button.layer.borderColor = UIColor.systemGray6.cgColor
            button.setImage(UIImage(named: "addButton"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        public let createLabal : UILabel = {
            let label = UILabel()
            label.text = "Create Story"
            label.textColor = .black
            label.textAlignment = .center
            label.font = .monospacedSystemFont(ofSize: 14, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    }
    
    class HomeStoryCollectionViewCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.layer.cornerRadius = 15
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            contentView.layer.borderWidth = 1
            contentView.backgroundColor = .systemGray6
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView(){
            contentView.addSubview(storyPostImage)
            contentView.addSubview(profileImage)
            contentView.addSubview(usernameLabel)
            
            
            NSLayoutConstraint.activate([
                profileImage.heightAnchor.constraint(equalToConstant: 50),
                profileImage.widthAnchor.constraint(equalToConstant: 50),
                profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                
                usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                
                storyPostImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                storyPostImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                storyPostImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                storyPostImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
        }
        
        public let profileImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 25
            image.layer.borderWidth = 2
            image.layer.borderColor = UIColor.blue.cgColor
            image.translatesAutoresizingMaskIntoConstraints = false
            image.clipsToBounds = true
            return image
        }()
        
        public let usernameLabel : UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.font = .monospacedSystemFont(ofSize: 14, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        public let storyPostImage : UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 15
            image.clipsToBounds = true
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        
    
}
