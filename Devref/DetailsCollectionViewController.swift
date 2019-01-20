//
//  DetailsCollectionViewController.swift
//  Devref
//
//  Created by Konstantin on 09/12/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

class DetailsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellIdText = "cellIdText"
    let cellIdImage = "cellIdImage"
    let header1IdCell = "header1IdCell"
    let header2IdCell = "header2IdCell"
    
    var informationArray: [MediaContent]?
   
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
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: cellIdText)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellIdImage)
        collectionView.register(Header1Cell.self, forCellWithReuseIdentifier: header1IdCell)
        collectionView.register(Header2Cell.self, forCellWithReuseIdentifier: header2IdCell)
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
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = informationArray![indexPath.row] as? IMG {
            let shemeViewController = SchemeViewController()
            shemeViewController.image = item.content
            navigationController?.present(shemeViewController, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: header1IdCell, for: indexPath)
        
        if let text = informationArray![indexPath.row] as? TXT {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdText , for: indexPath) as! TextCell
            cell.informationLabel.text = text.content
            return cell
        } else if let image = informationArray![indexPath.row] as? IMG {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdImage , for: indexPath) as! ImageCell
            cell.imageView.image = UIImage(named: image.content)
            return cell
        } else if let header1 = informationArray![indexPath.row] as? H1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: header1IdCell, for: indexPath) as! Header1Cell
            cell.header.text = header1.content
            return cell
        } else if let header2 = informationArray![indexPath.row] as? H2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: header2IdCell, for: indexPath) as! Header2Cell
            cell.header.text = header2.content
            return cell
        }
        
        return cell
        
        
    }
    
    
    
    
    
    
    
}
