//
//  navAppearence.swift
//  ReanTable
//
//  Created by Rithiya on 19/8/24.
//

import Foundation
import UIKit

extension UINavigationController {
    func setupNavBar(){
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        
        appearence.backgroundColor = .white
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearence.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        self.navigationBar.standardAppearance = appearence
        self.navigationBar.scrollEdgeAppearance = appearence
        self.navigationBar.compactAppearance = appearence
        
        self.navigationBar.tintColor = .black
        UIBarButtonItem.appearance().tintColor = .black
    }
}
