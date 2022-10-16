//
//  ViewControllerTwo.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 28/01/22.
//

import UIKit

import NVActivityIndicatorView

class ViewControllerTwo: UIViewController {
    let loadingAnimation = LoadingAnimation()
   let loadingAPI = LoadingAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "View Two"
    configure()
       
        // loader initialization
    
        // api parsing
       // loadingAPI.getRequest()
       
    }
    
    @IBAction func loadButtonPressed(_ sender: UIButton) {
        self.showSpinner()
        loadingAnimation.startLoading()
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        self.removeSpinner()
        loadingAnimation.stopLoading()
    }
    
}
//MARK: - adding right bar button item & navigating to roootVC
extension ViewControllerTwo{
    func configure(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(self.doneButtonTapped))
    }
    
    @objc func doneButtonTapped(){
        self.navigationController?.popToRootViewController(animated: true)

    }
}

extension ViewControllerTwo{
    //MARK: - url setup
    
    
    }
   

