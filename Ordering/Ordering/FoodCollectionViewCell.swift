//
//  FoodCollectionViewCell.swift
//  Ordering
//
//  Created by Angel Zambrano on 2/16/22.
//

import UIKit


// TODO: clean up
class FoodCollectionViewCell: UICollectionViewCell {
    
    let cview = UIView()
    var imageView = UIImageView()
    let title = UILabel()
    let descriptionLbl = UILabel()
    let price = UILabel()
    
    
        
    // TODO: clean up
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(imageView)
        
        imageView.image = UIImage(named: "190524-classic-american-cheeseburger-ew-207p")
        imageView.backgroundColor = .red
        

        imageView.anchor(top: cview.topAnchor, leading: cview.leadingAnchor, bottom: nil, trailing: cview.trailingAnchor, size: .init(width: 0, height: frame.size.width/2))
        
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        title.text = "ShackBurger"
        contentView.addSubview(title)
        
        title.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 10, bottom: 0, right: 0))
        
        descriptionLbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        descriptionLbl.textColor = UIColor(red: 126/255, green: 126/255, blue: 126/255, alpha: 1)
        descriptionLbl.text = "Cheeseburger with lettuce, tomato, ShackSauce (contains eggs, milk, soy, wheat, and gluten)"
        descriptionLbl.numberOfLines = 0
        
        contentView.addSubview(descriptionLbl)
        
        descriptionLbl.anchor(top: title.bottomAnchor, leading: title.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 10))
        
        price.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        price.text = "$6.29"
        contentView.addSubview(price)
        
        price.anchor(top: nil, leading: descriptionLbl.leadingAnchor, bottom: cview.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 15, right: 0))
        
    }
    
    // TODO: clean up
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cview.backgroundColor = .white
        
        
        contentView.addSubview(cview)
        
        cview.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
