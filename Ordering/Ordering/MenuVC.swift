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
    
    private var foodCollectionView: UICollectionView!
    
    let table = ["angel", "angel", "angel","angel", "angel", "angel", "angel", "angel"]
    
    
    
    // these values will be replaced with the values that we reques
    let values = ["appetizers",  "salads", "soups", "entrees", "desserts", "sandwiches", "tortas"]
    
    var tableView = UITableView()
    
    
    private let filtCellReuseIdentifier = "colorCellReuseIdentifier"
//    private let identifier = "tableviewID"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        navigationItem.title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        filtCollectionViewSetUp()
        
        foodCollectionViewSetUp()
       

        

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.contentSize.height = 100
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
//        layout.itemSize = CGSize(width: 20, height: 20)
//        UICollectionViewFlowLayout.automaticSize
        layout.invalidateLayout()
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        
        // adding a title to the navigation bar
        self.navigationItem.title = "Menu"
        
        
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
//        filtCollectionView.backgroundColor = .red
    }
    
    let identif = "identifier123"
    fileprivate func foodCollectionViewSetUp() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
//        layout.estimatedItemSize = UICollectionViewFlowLayout(cg)
//        layout.invalidateLayout()
//        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
        
        // adding a title to the navigation bar
//        self.navigationItem.title = "collectionviews"
        
        
        // TODO 1: Instantiate collectionView
        foodCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        foodCollectionView.translatesAutoresizingMaskIntoConstraints = false
        foodCollectionView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
        
        // TODO 3: Create collection view cell and register it here.
        // TODO 3a: Add content to collection view cell.
        // TODO 3b: Create function to configure collection view cell.
        foodCollectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: identif)
        
        
        
        //        // TODO 4: Extend collection view data source.
        foodCollectionView.dataSource = self
        
        //
        // TODO 5: Extend collection view delegate.
        foodCollectionView.delegate = self
        
        //
        view.addSubview(foodCollectionView)
        
//        foodCollectionView.backgroundColor = .blue
        
        foodCollectionView.anchor(top: filtCollectionView.bottomAnchor, leading: filtCollectionView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: filtCollectionView.trailingAnchor)
        
        
    }


}





extension MenuVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == filtCollectionView{
            return values.count
        }
        
        return 20
        // returns the number of
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        if collectionView == filtCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filtCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            cell.conf(str: values[indexPath.item])
            
            return cell
        }
        
        
        if collectionView == foodCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identif, for: indexPath) as! FoodCollectionViewCell
            cell.contentView.layer.cornerRadius = 10
            cell.cview.layer.cornerRadius = 10
            cell.contentView.clipsToBounds = true
            cell.cview.clipsToBounds = true
            cell.layer.shadowColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 0.5).cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 1.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identif, for: indexPath)
        return cell

        
    }
    
    

}


extension MenuVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView ==  foodCollectionView{
            let bounds = collectionView.bounds
            let heightVal = self.view.frame.height
            let widthVal = self.view.frame.width
            let cellsize = (heightVal < widthVal) ?  bounds.height/2 : bounds.width
            
            return CGSize(width: cellsize - 55   , height:  cellsize  - 70  )
        } else {
            
            
            return CGSize(width: 20, height: 20)
            
        }
     
        
    }
}




extension MenuVC: UICollectionViewDelegate {

    
    // TODO 9: provide selection functionality
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        if collectionView == filtCollectionView {
            print("hey!!")
        }
        
        // select the correct collection view
//            filters.forEach({$0.selected = false}) // deselects

//            filters[indexPath.item].selected = !filters[indexPath.item].selected




//            collectionView.reloadData()


    }
}
