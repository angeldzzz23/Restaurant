//
//  FilterCollectionViewCell.swift
//  Ordering
//
//  Created by Angel Zambrano on 2/16/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    private var filtLabel: UILabel = UILabel()
    
    private var button: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        filtLabel.translatesAutoresizingMaskIntoConstraints = false
        filtLabel.font = UIFont.systemFont(ofSize: 12)
        filtLabel.textColor = .black
        filtLabel.text = "WEED"
        contentView.addSubview(filtLabel)
        
        contentView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
        contentView.layer.cornerRadius = 12
        
        
        button.imageView?.image = UIImage(named: "close-4")!
        button.setImage(UIImage(named: "close-4")!, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = UIColor(red: 46/255, green: 78/255, blue: 136/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: 10).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
//        contentView.addSubview(button)

  
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
