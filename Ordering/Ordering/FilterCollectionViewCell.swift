//
//  FilterCollectionViewCell.swift
//  Ordering
//
//  Created by Angel Zambrano on 2/16/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    private var filtLabel: UILabel = UILabel()
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        filtLabel.translatesAutoresizingMaskIntoConstraints = false
        filtLabel.font = UIFont.systemFont(ofSize: 16)
        filtLabel.textColor = .black
        filtLabel.text = "WEED"
        contentView.addSubview(filtLabel)
        
        contentView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
        contentView.layer.cornerRadius = 12
        
        

  
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
       
        NSLayoutConstraint.activate([
            filtLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            filtLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            filtLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            filtLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
    

        
        
        
        
    }
    
    func conf(str: String) {
        filtLabel.text = str

    }
    
}
