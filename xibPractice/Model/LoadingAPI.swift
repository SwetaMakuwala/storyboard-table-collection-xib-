//
//  LoadingAPI.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 08/02/22.
//

import Foundation
import Alamofire


struct LoadingAPI{
    let loadingnimation = LoadingAnimation()
    func getRequest(){
        AF.request("https://reqres.in/api/products/3").responseJSON { response in
            if response == nil{
                loadingnimation.startLoading()
            } else{
                loadingnimation.stopLoading()
                print(response)
            }
            
        }
        }
}
