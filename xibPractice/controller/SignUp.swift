//
//  ViewControllerOne.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 28/01/22.
//

import UIKit
/* reference:
 https://medium.com/@ankit.bhana19/save-custom-objects-into-userdefaults-using-codable-in-swift-5-1-protocol-oriented-approach-ae36175180d8
 https://fluffy.es/move-view-when-keyboard-is-shown/ */
// used user defaults to display text of textfield to label.
// view adjustment when keyboard pops up(without using scroll view)
class SignUP: UIViewController {
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let userDefaults = UserDefaults.standard
    
  
    
    var activeTextField: UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        // navigation configuration
        configure()
        
        // keyboard setting:
        NotificationCenter.default.addObserver(self, selector: #selector(SignUP.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUP.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func showDataButtonPressed(_ sender: UIButton) {
        do{
           //let decodedOutput =  try userDefaults.getObject(forKey: "UserInfo", castTo: UserDefaultModel.self)
            let decodedOutput = try userDefaults.getObject(forKey: "UserInfoClass", castTo: UserDefaultClass.self)
            nameLabel.text = decodedOutput.name
            addressLabel.text = decodedOutput.address
            emailLabel.text = decodedOutput.email
            
            
        } catch{
            print(error.localizedDescription)
        }

    }
}
//MARK: - navigation Setup:

extension SignUP{
    func configure(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectorFunc))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
    }
    @objc func selectorFunc(){
        if  let vcTwo = storyboard?.instantiateViewController(withIdentifier: "ViewControllerTwo") as? ViewControllerTwo {
            navigationController?.pushViewController(vcTwo, animated: true)
        }
        
    }
}

//MARK: - textfield delegate :
extension SignUP: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        resignFirstResponder()

        var name : String = ""
        var address : String = ""
        var email : String = ""
        
        if let nameForBinding = nameTextField.text {
            name = nameForBinding
        }
        if let addressForBinding = addressTextField.text {
            address = addressForBinding
        }
        if let emailForBinding = emailTextField.text{
            email = emailForBinding
        }
        let model = UserDefaultModel(name: name, address: address, email: email)
  let modelClass = UserDefaultClass(name: name, address: address, email: email)
        do {
            try userDefaults.setObject(model, forKey: "UserInfo")
            try userDefaults.setObject(modelClass, forKey: "UserInfoClass")
        } catch{
            print(error.localizedDescription)
        }
       
       
            
  
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
     

        activeTextField = nil
    }
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]as? NSValue)?.cgRectValue else { return }
        var shouldMoveUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveUp = true
            }
        }
        if shouldMoveUp {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
    
  
}
