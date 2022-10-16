//
//  LoadingAnimation.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 08/02/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

fileprivate var  aView: NVActivityIndicatorView?
fileprivate var activityIndicatorView: UIActivityIndicatorView?

//fileprivate let navigationView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .circleStrokeSpin, color: .black, padding: 0)
extension UIViewController {
    
    func showSpinner() {
        aView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .circleStrokeSpin, color: .black, padding: 0)
//        aView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
  //    aView = UIActivityIndicatorView(style: .whiteLarge)
//        activityIndicatorView?.center = aView!.center
//        activityIndicatorView?.startAnimating()
//        aView?.addSubview(activityIndicatorView!)
   self.view.addSubview(aView!)
        aView?.center = view.center
        aView?.startAnimating()
    }
    func removeSpinner(){
        
        aView?.removeFromSuperview()
        aView?.stopAnimating()
        aView = nil
    }
}
// 
//0261 6611980
class LoadingAnimation{
   // let shared = LoadingAnimation()
   
    let navigationView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .circleStrokeSpin, color: .black, padding: 0)
 func startLoading() {
     let sceneDelegate = SceneDelegate()
     let window = sceneDelegate.window
     let view =   window?.rootViewController?.view
     view?.addSubview(navigationView)
     navigationView.center = view?.center ?? CGPoint(x : 0, y: 0)
     navigationView.startAnimating()
    
//     if  let viewpass = delegate?.window {
//         viewpass.addSubview(navigationView)
//              navigationView.center = viewpass.center
//              navigationView.startAnimating()
//     }
     
     
    }
  func stopLoading(){
      navigationView.stopAnimating()
       // navigationView.stopAnimating()
    }
}
