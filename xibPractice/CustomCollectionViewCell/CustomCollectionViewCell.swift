//
//  CustomCollectionViewCell.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 26/01/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var collectionPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    
    }
    
    func cellSetup(model: Results) {
        artistName.text = model.artistName
        collectionName.text = model.collectionName
        collectionPrice.text = String(model.collectionPrice)
        imageDisplay(url: model.artworkUrl30 )
    }
    
}
extension CustomCollectionViewCell {
    func imageDisplay(url: String){
        if let url = URL(string: url ){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [self]data, response , error   in
                if let data = data , error == nil {
                    DispatchQueue.main.async {
                        print(data)
                        self.imageOfCell.image = UIImage(data: data)
                    }
                    if let error = error {
                        print("error : \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
}
