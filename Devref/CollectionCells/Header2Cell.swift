//
//  Header2CollectionViewCell.swift
//  Devref
//
//  Created by Konstantin on 19/01/2019.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

import UIKit

class Header2Cell: UICollectionViewCell {
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    var header: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func setUpViews() {
        contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        header.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        
        backgroundColor = UIColor.white
        contentView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
    }
}




