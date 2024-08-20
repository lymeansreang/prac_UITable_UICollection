//
//  StoryCollection.swift
//  ReanTable
//
//  Created by Rithiya on 20/8/24.
//

import UIKit

class StoryCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .blue
        guard let myCollection = collectionView else { return }
        view.addSubview(myCollection)
        
        NSLayoutConstraint.activate([
                        myCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                        myCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        myCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        myCollection.heightAnchor.constraint(equalToConstant: 150)
                    ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

