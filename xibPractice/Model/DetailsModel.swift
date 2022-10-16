//
//  DetailsModel.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 24/01/22.
//

import Foundation
struct DetailsModel: Decodable{
    let resultCount: Int
    let results : [Results]

}
struct Results: Decodable {
    let artistName: String
    let collectionName: String
    let collectionPrice: Double
    let artworkUrl30: String
}

