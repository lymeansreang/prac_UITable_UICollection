//
//  PostViewController.swift
//  ReanTable
//
//  Created by Rithiya on 19/8/24.
//

import UIKit

class PostViewController: UIViewController {

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profile1")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dara"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func optButton(title: String) -> OptionButton{
        let button = OptionButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.contentMode = .scaleAspectFill
        button.textSize = 12
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }
    
//    private let optionStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 3
//        stackView.backgroundColor = .blue
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    private lazy var friendButton = optButton(title: "Friend")
    private lazy var albumButton = optButton(title: "Album")
    private lazy var offButton = optButton(title: "Off")
    private lazy var aiLabelButton = optButton(title: "Ai Label off")
    
    private func setupView(){
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(friendButton)
        view.addSubview(albumButton)
        view.addSubview(offButton)
//        view.addSubview(aiLabelButton)
//        view.addSubview(optionStackView)
//        
//        optionStackView.addArrangedSubview(friendButton)
//        optionStackView.addArrangedSubview(albumButton)
//        optionStackView.addArrangedSubview(offButton)
//        optionStackView.addArrangedSubview(aiLabelButton)
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            friendButton.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            friendButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            friendButton.widthAnchor.constraint(equalToConstant: 80),
            friendButton.heightAnchor.constraint(equalToConstant: 35),
            
            albumButton.leadingAnchor.constraint(equalTo: friendButton.trailingAnchor, constant: 6),
            albumButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            albumButton.widthAnchor.constraint(equalToConstant: 80),
            albumButton.heightAnchor.constraint(equalToConstant: 35),
            
            offButton.leadingAnchor.constraint(equalTo: albumButton.trailingAnchor, constant: 6),
            offButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            offButton.widthAnchor.constraint(equalToConstant: 80),
            offButton.heightAnchor.constraint(equalToConstant: 35),
            
//            aiLabelButton.leadingAnchor.constraint(equalTo: offButton.trailingAnchor, constant: 6),
//            aiLabelButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
//            aiLabelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
//            aiLabelButton.widthAnchor.constraint(equalToConstant: 80),
//            aiLabelButton.heightAnchor.constraint(equalToConstant: 35),
            
//            optionStackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
//            optionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            optionStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
//            optionStackView.widthAnchor.constraint(equalToConstant: 80),
//            optionStackView.heightAnchor.constraint(equalToConstant: 35),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: nil)

        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Create Post", style: .done, target: self, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
    
    }
    

}

class OptionButton: UIButton {
    var textFont: UIFont! = nil
    var textSize: CGFloat = 0
}
