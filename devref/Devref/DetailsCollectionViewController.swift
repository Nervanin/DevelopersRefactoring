//
//  DetailsCollectionViewController.swift
//  Devref
//
//  Created by Konstantin on 09/12/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

class DetailsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    
    var informationArray: [ImageAndText]?
    lazy var text = [TXT]()
    lazy var image = [IMG]()
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for item in informationArray! {
            if item is IMG {
                image.append(item as! IMG)
            } else if item is TXT {
                text.append(item as! TXT)
            }
        }
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: cellId1)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellId2)
        collectionView.collectionViewLayout = layout
        
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.alwaysBounceVertical = true
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //return count of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return informationArray!.count
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    
    
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let item = informationArray![indexPath.row] as? IMG {
                let shemeViewController = SchemeViewController()
                shemeViewController.image = item.image
                navigationController?.present(shemeViewController, animated: true, completion: nil)
                
            }
        }
        
    
    
    
    
        
        
        
        
        
        // let cusnomView = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! ImageCell
        // cusnomView.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:))))
        
        //if cell == cell.imageView {
       // if target(forAction: #selector(image), withSender: <#T##Any?#>)
//            collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:))))
//            let schemeViewController = SchemeViewController()
//            schemeViewController.image = image[indexPath.row].image!
//            present(schemeViewController, animated: false , completion: nil)
        
        //                        cell.imageView.isUserInteractionEnabled = true
        //                        collectionView.addSubview(cell)
        //collectionView.addSubview(cusnomView)
        
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
        
        if informationArray![indexPath.item] is TXT {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1 , for: indexPath) as! TextCell
            cell.informationLabel.text = text[indexPath.section].text
            return cell
        } else if informationArray![indexPath.section] is IMG {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2 , for: indexPath) as! ImageCell
            cell.imageView.image = UIImage(named: image[indexPath.row].image!)
            return cell
        }
        
        return cell
    }
    
    
    
    
    
    
    
}
