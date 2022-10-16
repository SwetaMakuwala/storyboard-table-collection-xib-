//
//  ViewController.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 24/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var details : DetailsModel?
    let apiManager = APIManager()
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table"
      
        
        // configuring navigation bar
        configureItems()
        
        //getting data to display in table
        details =  apiManager.parseJSon()
        
        //registering tableView
        listTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        listTableView.delegate = self
        listTableView.dataSource = self
    }
}
//MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if let count = details?.results.count {
            listTableView.restore()
            return count
        } else {
            listTableView.setEmptyMessage("No Data received")
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "customTableViewCell"
        var modelUnwrapped : Results!
        if let model = details?.results[indexPath.row] {
            modelUnwrapped = model
        }
        var cell = UITableViewCell()
        if let cellUnwrapped = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCell {
            cellUnwrapped.setUpCell(modelResult: modelUnwrapped)
            cell = cellUnwrapped
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK: - navigation settings
extension ViewController {
    func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCollectionVc))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
    }
    @objc func showCollectionVc(){
        if let collectionVC = storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController {
            collectionVC.dataSources = details
            self.navigationController?.pushViewController(collectionVC, animated: true)
            
        }
        
        
    }
    
}
extension UITableView{
    func setEmptyMessage (_ message: String) {
        let messageLable = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLable.text = message
        messageLable.numberOfLines = 0
        messageLable.textAlignment = .center
        messageLable.sizeToFit()
        messageLable.font = UIFont.systemFont(ofSize: 25)
        
        self.backgroundView = messageLable
        
    }
    func restore() {
        self.backgroundView = nil
    }
}
