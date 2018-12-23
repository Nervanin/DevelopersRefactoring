//
//  MainScreenViewController.swift
//  Devref
//
//  Created by Konstantin on 04.07.2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit
import SnapKit

extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}
//first scene in this app
class MenuViewController: UIViewController, ButtonProtocol {
    
    //buttons in MainMenu for move to self.list
    var designPatternsButton = UIButton(type: .custom)
    var dataStructuressButton = UIButton(type: .custom)
    var algorithmsButton = UIButton(type: .custom)
    
    var modelsArray: [Models]? = ParseDataSourse.allModels()
    //our arrays from ParseDataSourse class. instance of Models(patterns, dataStructures and algorithms)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        // configure buttons in Main Menu
        designPatternsButton.setImage(UIImage(named: "designPatternsButton.png"), for: .normal)
        dataStructuressButton.setImage(UIImage(named: "dataStructuresButton.png"), for: .normal)
        algorithmsButton.setImage(UIImage(named: "algorithmsButton.png"), for: .normal)
        designPatternsButton.addTarget(nil, action: #selector(ButtonProtocol.buttonAction), for: .touchUpInside)
        dataStructuressButton.addTarget(nil, action: #selector(ButtonProtocol.buttonAction), for: .touchUpInside)
        algorithmsButton.addTarget(nil, action: #selector(ButtonProtocol.buttonAction), for: .touchUpInside)
        // create stak container for buttons and create constranes for him, thanks to SnapKit
        let stackView = UIStackView(arrangedSubviews: [designPatternsButton, dataStructuressButton, algorithmsButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.axis = .vertical
        stackView.spacing = 35
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.navigationItem.title = "Main Menu"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        designPatternsButton.adjustsImageWhenHighlighted = false
        dataStructuressButton.adjustsImageWhenHighlighted = false
        algorithmsButton.adjustsImageWhenHighlighted = false
    }
    
    // our navigate button to add list-scene of our change
    func buttonAction(_ sender: UIButton) {
        var patterns: [Patterns]? = [Patterns]()
        var dataStructures: [DataStructures]? = [DataStructures]()
        var algorithms: [Algorithms]? = [Algorithms]()
        let listViewController = ListViewController()
        for item in modelsArray! {
            if item is Patterns {
                patterns?.append(item as! Patterns)
            } else if item is DataStructures {
                dataStructures?.append(item as! DataStructures)
            } else if item is Algorithms {
                algorithms?.append(item as! Algorithms)
            }
        }
        if sender == designPatternsButton {
            listViewController.modelsArray = patterns
            navigationController?.pushViewController(listViewController, animated: true)
        } else if sender == dataStructuressButton {
            listViewController.modelsArray = dataStructures
            navigationController?.pushViewController(listViewController, animated: true)
        } else if sender == algorithmsButton {
            listViewController.modelsArray = algorithms
            navigationController?.pushViewController(listViewController, animated: true)
        }
    }
    
}

