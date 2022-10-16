//
//  CustomViewNoData.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 31/01/22.
//

import UIKit

class CustomViewNoData: UIView {
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var labelTwo: UILabel!
    
    func instanceFromNib() -> CustomViewNoData {
        var view : CustomViewNoData!
        if  let viewUnwrapped = UINib(nibName: "CustomViewNoData", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CustomViewNoData {
            viewUnwrapped.setUp(img: "Vector", msg1: "NO Data", msg2: "Try Again")
            view = viewUnwrapped
        }
        
        return view
    }
    fileprivate func setUp(img imgData : String , msg1 msg1: String , msg2 msg2: String ){
        labelOne.text = msg1
        imageDisplay.image = UIImage(named: imgData)
        labelTwo.text = msg2
    }

    @IBAction func loadData(_ sender: UIButton) {
        let apiManager = APIManager()
       let apiOutput =  apiManager.parseJSon()
        print(apiOutput)
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
    }
}

