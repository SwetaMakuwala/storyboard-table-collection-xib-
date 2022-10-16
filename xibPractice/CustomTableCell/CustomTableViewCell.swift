//
//  CustomTableViewCell.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 24/01/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var collectionPrice: UILabel!
    @IBOutlet weak var imageOfCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    imageOfCell.layer.cornerRadius = self.imageOfCell.frame.width / 2
        imageOfCell.layer.borderWidth = 1
        imageOfCell.layer.borderColor = UIColor.black.cgColor
        imageOfCell.clipsToBounds = true
      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUpCell(modelResult: Results){
        artistName.text =  String(modelResult.artistName)
        collectionName.text = modelResult.collectionName
        collectionPrice.text = String(modelResult.collectionPrice)
        imageDisplay(url: modelResult.artworkUrl30 )
    }
}
extension CustomTableViewCell{
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
