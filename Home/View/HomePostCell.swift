//
//  HomePostCell.swift
//  ReanTable
//
//  Created by Rithiya on 16/8/24.
//

import UIKit

class HomePostCell: UITableViewCell {
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var hourLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var postingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var likeEmojiImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var heartEmojiImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var happyEmojiImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var totalLikeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var shareLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var reactionStackView: UIStackView = {
        let stackView = UIStackView()
        let label = UILabel()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likeButton = initButton(title: "Like", icon: "like")
    private lazy var commentButton = initButton(title: "Cmt", icon: "comment")
    private lazy var sendButton = initButton(title: "Send", icon: "send")
    private lazy var shareButton = initButton(title: "Share", icon: "share")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
        
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func likeButtonTapped(_ sender: UIButton){
        print("like")
    }
    
    private func initButton(title: String, icon: String) -> SocialButton {
        let button = SocialButton()
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: icon), for: .normal)
        button.setTitle(title, for: .normal)
        button.textSize = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    private func setupView() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(hourLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(postingImage)
        contentView.addSubview(heartEmojiImage)
        contentView.addSubview(happyEmojiImage)
        contentView.addSubview(totalLikeLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(shareLabel)
        contentView.addSubview(reactionStackView)
        
        reactionStackView.addArrangedSubview(likeButton)
        reactionStackView.addArrangedSubview(commentButton)
        reactionStackView.addArrangedSubview(sendButton)
        reactionStackView.addArrangedSubview(shareButton)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            
            hourLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            hourLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            postingImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 5),
            postingImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            postingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            
            heartEmojiImage.topAnchor.constraint(equalTo: postingImage.bottomAnchor, constant: 3),
            heartEmojiImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            heartEmojiImage.heightAnchor.constraint(equalToConstant: 20),
            heartEmojiImage.widthAnchor.constraint(equalToConstant: 20),
            
            happyEmojiImage.topAnchor.constraint(equalTo: postingImage.bottomAnchor, constant: 3),
            happyEmojiImage.leadingAnchor.constraint(equalTo: heartEmojiImage.trailingAnchor),
            happyEmojiImage.heightAnchor.constraint(equalToConstant: 20),
            happyEmojiImage.widthAnchor.constraint(equalToConstant: 20),
            
            totalLikeLabel.topAnchor.constraint(equalTo: postingImage.bottomAnchor, constant: 4),
            totalLikeLabel.leadingAnchor.constraint(equalTo: happyEmojiImage.trailingAnchor, constant: 5),
            
            commentLabel.topAnchor.constraint(equalTo: postingImage.bottomAnchor, constant: 4),
            commentLabel.trailingAnchor.constraint(equalTo: shareLabel.leadingAnchor, constant: -6),
            
            shareLabel.topAnchor.constraint(equalTo: postingImage.bottomAnchor, constant: 4),
            shareLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
            reactionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reactionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reactionStackView.topAnchor.constraint(equalTo: happyEmojiImage.bottomAnchor,constant: 5),
            reactionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor ,constant: -10),
            reactionStackView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        
        
        
    }
    
}

class MyEmoji: UIImageView {
    var imageView: UIImageView! = nil
}

class SocialButton: UIButton {
    var titleFont: UIFont! = nil
    var textSize: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleFont = titleLabel?.font ?? .none
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.titleFont = titleLabel?.font ?? .none
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: textSize + 10, height: 30)
        //why height is 30? You want your imageView to be of height 25 and want top and bottom insets to be 5 each so 25 + 5 + 5 = 30
        //Why textSize + 40? You want your button to take appropriate size of text + 5 left inset of image + 25 of imageView + 5 left inset of title + 5 right inset of title
    }

    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 9, y: 8, width: 25, height: 25)
        //why x is 5 because you want your image to have left inset of 5
        //why y is 2.5 ? Your button height is 30, image height is 25 so (30 - 25) / 2 = 2.5
    }

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if let string = self.title(for: .normal) {
            textSize = string.widthOfString(usingFont: titleLabel!.font)
            return CGRect(origin: CGPoint(x: 35, y: 0), size: CGSize(width: textSize + 10, height: 40))
            //same explanation why x is 35 ? 5 (left inset of image) + 25 (image width) + 5 (left inset of text) = 35
        }
        return CGRect.zero
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

class NavigationBar: UIView {
    
}
