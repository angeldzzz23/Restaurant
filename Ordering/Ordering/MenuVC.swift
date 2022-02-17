//
//  VC2.swift
//  Ordering
//
//  Created by Angel Zambrano on 2/15/22.
//

import UIKit

class MenuVC: UIViewController {

    // creating a collection view
    private var filtCollectionView: UICollectionView! // the filter collection view
    
    
    // these values will be replaced with the values that we reques
    let values = ["appetizers",  "salads", "soups", "entrees", "desserts", "sandwiches", "tortas"]
    
    private let filtCellReuseIdentifier = "colorCellReuseIdentifier"
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        navigationItem.title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        filtCollectionViewSetUp()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filtCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            filtCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filtCollectionView.heightAnchor.constraint(equalToConstant: 60),
            filtCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    
    fileprivate func filtCollectionViewSetUp() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.invalidateLayout()
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        // adding a title to the navigation bar
        self.navigationItem.title = "collectionviews"
        
        
        // TODO 1: Instantiate collectionView
        filtCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filtCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filtCollectionView.backgroundColor = .clear
        
        
        
        // TODO 3: Create collection view cell and register it here.
        // TODO 3a: Add content to collection view cell.
        // TODO 3b: Create function to configure collection view cell.
        filtCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filtCellReuseIdentifier)
        
        
        
        //        // TODO 4: Extend collection view data source.
        filtCollectionView.dataSource = self
        
        //
        // TODO 5: Extend collection view delegate.
        filtCollectionView.delegate = self
        
        //
        view.addSubview(filtCollectionView)
        
        setupConstraints()
        filtCollectionView.backgroundColor = .red
    }


}


extension MenuVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
            return values.count
        
        
        // returns the number of
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filtCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            
            cell.conf(str: values[indexPath.item])
            return cell
        
    }
    
    

}



extension MenuVC: UICollectionViewDelegate {

    // TODO 9: provide selection functionality
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        // select the correct collection view
//            filters.forEach({$0.selected = false}) // deselects
//
//            filters[indexPath.item].selected = !filters[indexPath.item].selected
//
//
//
//
//            collectionView.reloadData()
//
//
//    }
}
