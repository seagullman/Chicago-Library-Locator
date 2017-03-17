//
//  NetworkClient.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Alamofire

protocol NetworkInterface {
    func getLibraries(completion: @escaping ([Library]) -> Void)
}

class NetworkClient: NetworkInterface {
    
    let librariesURL = "https://data.cityofchicago.org/resource/x8fc-8rcq.json"
    
    func getLibraries(completion: @escaping ([Library]) -> Void) {
        
        Alamofire.request(librariesURL,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { response in
                guard let data = response.data else { return }
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                
                var libraries: [Library] = []
                
                json?.forEach({ (library) in
                    libraries.append(Library(dict: library as! [String : AnyObject]))
                })
                
                completion(libraries)
        }
    }
}
