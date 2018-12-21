//
//  DataInformationViewController.swift
//  Devref
//
//  Created by Konstantin on 16.09.2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var modelsArray: [Models]? = [Models]()
    lazy var dataStructureArray: [DataStructures]? = [DataStructures]()
    lazy var patternsArray: [Patterns]? = [Patterns]()
    lazy var algorithmsArray: [Algorithms]? = [Algorithms]()
    
    var cellId = "cellId" // id of cell
    
    let tableViewDataInformation: UITableView = {
        
        var tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in modelsArray! {
            if item is Patterns {
                patternsArray?.append(item as! Patterns)
            } else if item is DataStructures {
                dataStructureArray?.append(item as! DataStructures)
            } else if item is Algorithms {
                algorithmsArray?.append(item as! Algorithms)
            }
        }
        
        
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
        if dataStructureArray!.isEmpty && algorithmsArray!.isEmpty {
            return patternsArray!.count
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // method, where we change how row must be in each section(remeber: default section in list - 1)
        if dataStructureArray!.isEmpty && algorithmsArray!.isEmpty {
            return self.patternsArray![section].patternsModels!.count
        } else if patternsArray!.isEmpty && algorithmsArray!.isEmpty {
            return self.dataStructureArray!.count
        } else {
            return self.algorithmsArray!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // configure cell method
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if dataStructureArray!.isEmpty && algorithmsArray!.isEmpty {
            cell.textLabel?.text = patternsArray![indexPath.section].patternsModels![indexPath.row].title
        } else if patternsArray!.isEmpty && algorithmsArray!.isEmpty {
            cell.textLabel?.text = dataStructureArray![indexPath.row].title
        } else {
            cell.textLabel?.text = self.algorithmsArray![indexPath.row].title
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if dataStructureArray!.isEmpty && algorithmsArray!.isEmpty {
            return patternsArray![section].title
        }
        return nil
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let detailsCollection = DetailsCollectionViewController()
            if dataStructureArray!.isEmpty && algorithmsArray!.isEmpty {
                for item in patternsArray![indexPath.section].patternsModels! {
                    if item.section == indexPath.section {
                        if item.id == indexPath.row {
                            detailsCollection.title = item.title
                            detailsCollection.informationArray = item.informationArray
                            navigationController?.pushViewController(detailsCollection, animated: true)
                        }
                    }
                }
            } else if patternsArray!.isEmpty && algorithmsArray!.isEmpty {
                for item in dataStructureArray! {
                    if item.id == indexPath.row {
                        detailsCollection.title = item.title
                        detailsCollection.informationArray = item.informationArray
                        navigationController?.pushViewController(detailsCollection, animated: true)
                    }
                }
                
            } else {
                for item in algorithmsArray! {
                    if item.id == indexPath.row {
                        detailsCollection.title = item.title
                        detailsCollection.informationArray = item.informationArray
                        navigationController?.pushViewController(detailsCollection, animated: true)
                    }
                }
            }
    }
    
    
}

