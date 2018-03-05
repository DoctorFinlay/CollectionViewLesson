//
//  APIService.swift
//  CollectionViewPractice
//
//  Created by Iain Coleman on 05/03/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

typealias CompletionHandler = (_ Success: Bool) -> ()

class APIService {
    
    static let instance = APIService()
    
    public private(set) var array1 = [Photo]()
    public private(set) var array2 = [Photo]()
    
    
    
    func getPhotos(completion: @escaping CompletionHandler) {
        
        //NOT using Alamofire or any third party framework for this project!
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/photos"
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in DispatchQueue.main.async {
            guard responseError == nil else {
                completion(false)
                return
            }
            
            guard let jsonData = responseData else {
                debugPrint(responseError as Any)
                completion(false)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                self.array1.removeAll()
                self.array1 = try decoder.decode([Photo].self, from: jsonData)
                self.array2.removeAll()
                self.array2 = try decoder.decode([Photo].self, from: jsonData)
                completion(true)
            } catch {
                debugPrint(responseError as Any)
                completion(false)
            }
            }
            
        }
        task.resume()
    }
    
    

    
    
    
}
