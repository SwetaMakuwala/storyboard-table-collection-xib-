//
//  UserDefaultsInfo.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 03/02/22.
//

import Foundation
protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey : String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
extension UserDefaults: ObjectSavable {
    
    func setObject<Object>(_ object: Object, forKey: String) throws where Object : Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        }catch {
            throw ObjectSavableError.unableToencode
        }
    }
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object : Decodable {
        guard let data = data(forKey: forKey) else {
            throw ObjectSavableError.noValue
        }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        }catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}
//MARK: Enum for error
enum ObjectSavableError: String, LocalizedError{
case unableToencode = "unable to encode object into data"
case noValue = "no data object found for the given key"
case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
