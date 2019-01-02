//
//  TextCell.swift
//  Devref
//
//  Created by Konstantin on 20/12/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

class TextCell: UICollectionViewCell {
    
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
    
    var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "any text"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    func setUpViews() {
        contentView.addSubview(informationLabel)
        informationLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        informationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        informationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        
        backgroundColor = UIColor.white
        contentView.bottomAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 10).isActive = true
    }
}



