//
//  MainScreenViewController.swift
//  Devref
//
//  Created by Konstantin on 04.07.2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit
import SnapKit

//first scene in this app
class MenuViewController: UIViewController {
    
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
        designPatternsButton.addTarget(nil, action: #selector(menuButtonPressed), for: .touchUpInside)
        dataStructuressButton.addTarget(nil, action: #selector(menuButtonPressed), for: .touchUpInside)
        algorithmsButton.addTarget(nil, action: #selector(menuButtonPressed), for: .touchUpInside)
        
        // designPatternsButton.addTarget(self, action: #selector(action(_sender:)), for: .touchUpInside)
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
    
    //our navigate button to add list-scene of our change
    @objc func menuButtonPressed(_ sender: UIButton) {
        let listViewController = ListViewController()
        for model in modelsArray! {
            if sender == designPatternsButton && model is Pattern {
                listViewController.modelsArray?.append(model)
            } else if sender == dataStructuressButton && model is DataStructure {
                listViewController.modelsArray?.append(model)
            } else if sender == algorithmsButton && model is Algorithm {
                listViewController.modelsArray?.append(model)
            }
        }
        navigationController?.pushViewController(listViewController, animated: true)
    }


}



