//
//  APIManager.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 24/01/22.
//

import Foundation
struct APIManager{
    let urlOfImage = "http://placehold.it/120x120&text=image1"
    
    func parseJSon() -> DetailsModel? {
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "songs", withExtension: "json")!)
            let decodedOutput = try JSONDecoder().decode(DetailsModel.self, from: data)
            return decodedOutput
            
        } catch {
            print("there is an error")
            return nil
        }
    }
}


