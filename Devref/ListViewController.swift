//
//  DataInformationViewController.swift
//  Devref
//
//  Created by Konstantin on 16.09.2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cellId = "cellId" // id of cell
    
    var modelsArray: [Models]? = [Models]()
    
    let tableViewDataInformation: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataInformation.register(UITableViewCell.self, forCellReuseIdentifier: cellId)//registrer cell with our id
        
        tableViewDataInformation.dataSource = self
        tableViewDataInformation.delegate = self
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9837288015, blue: 0.9678939283, alpha: 1)
        tableViewDataInformation.frame = view.frame
        tableViewDataInformation.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableViewDataInformation)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        for model in modelsArray! {
            if model is Pattern {
                return modelsArray!.count
            } else {
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // method, where we change how row must be in each section(remeber: default section in list - 1)
        
        if let item = modelsArray![section] as? Pattern {
            return item.patternsSection!.count
        } else {
            return modelsArray!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // configure cell method
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let item = modelsArray![indexPath.section] as? Pattern {
            cell.textLabel?.text = item.patternsSection![indexPath.row].title
        } else if let item = modelsArray![indexPath.row] as? DataStructure {
            cell.textLabel?.text = item.title
        } else if let item = modelsArray![indexPath.row] as? Algorithm {
            cell.textLabel?.text = item.title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let item = modelsArray![section] as? Pattern {
            return item.title
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsCollection = DetailsCollectionViewController()
        if let model = modelsArray![indexPath.section] as? Pattern {
            if let item = model.patternsSection {
                if item[indexPath.section].section == indexPath.section {
                    if item[indexPath.row].id == indexPath.row {
                        detailsCollection.title = item[indexPath.row].title
                        detailsCollection.informationArray = item[indexPath.row].informationArray
                    }
                }
            }
        } else if let item = modelsArray![indexPath.row] as? DataStructure {
            if item.id == indexPath.row {
                detailsCollection.title = item.title
                detailsCollection.informationArray = item.informationArray
            }
        } else if let item = modelsArray![indexPath.row] as? Algorithm {
            if item.id == indexPath.row {
                detailsCollection.title = item.title
                detailsCollection.informationArray = item.informationArray
            }
        }
        navigationController?.pushViewController(detailsCollection, animated: true)
    }
    
    
}
