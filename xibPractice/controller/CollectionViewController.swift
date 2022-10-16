//
//  CollectionViewController.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 27/01/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate {
    var dataSources: DetailsModel?
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection"
        
        // configuring navigation bar
        configureItems()
        
        //collectionVew Registration
        myCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
//        if dataSources == nil {
//            let alert = UIAlertController(title: "NO DATA", message: "No data to display", preferredStyle: .alert)
//            let sheet = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
//            alert.addAction(sheet)
//            self.present(alert, animated: true, completion: nil)
//        }
        
    }
}
//MARK: - collection View

extension CollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = dataSources?.results.count {
            myCollectionView.restore()
            return count
        } else {
            myCollectionView.setEmptyView()
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cell = UICollectionViewCell()
        if let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell {
            if let model = dataSources?.results[indexPath.row] {
            collectionCell.cellSetup(model: model)
           cell = collectionCell
            }
            
        }
        return cell
    }
    
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let collectionViewSize = collectionView.frame.size.width - 50
        return CGSize(width: collectionViewSize / 2, height: 240
        )
    }
}
//MARK: - navigation bar configuration
extension CollectionViewController{
    func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentViewOne))
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
    }
    @objc func presentViewOne(){
        if let viewOne = storyboard?.instantiateViewController(withIdentifier: "ViewControllerOne") as? SignUP {
            navigationController?.pushViewController(viewOne, animated: true)
        }
        
    }
}
extension UICollectionView {
    func setEmptyView(){
       let emptyDisplay = CustomViewNoData()
       let view =  emptyDisplay.instanceFromNib()
        self.backgroundView = view
        
    }
    func restore() {
        self.backgroundView = nil
    }
}
