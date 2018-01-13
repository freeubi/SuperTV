//
//  ChannelDataManager.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

class ChannelDataManager: NSObject {

    // MARK: - Properties
    let dataURL = URL(string:"https://gist.githubusercontent.com/reden87/ad856e7994b8ea93ac27503ecb051347/raw/050c539749f3d253a01ad685983ebc8503ea7872/example.json")
    
    enum ChannelDataError: Error {
        case noData
    }
    
    
    // MARK: - Init
    override init() {
        
    }
    
    func getChannelData() {
        
        getJsonFromUrl(url: dataURL!) {
            (result, error) in
            
            if result != nil {
                
                dump(result)
            }else {
                dump(error)
            }
        }
        
    }
    
    private func getJsonFromUrl(url: URL, completionHandler: @escaping (String?, Error?) -> Void) {
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            // handle response to request
            
            // check for error
            guard error == nil else {
                completionHandler(nil, error!)
                return
            }
            
            // make sure we got data in the response
            guard let responseData = data else {
                print("Error: did not receive data from url: " + url.absoluteString)
                
                completionHandler(nil, ChannelDataError.noData)
                return
            }

            let jsonString = String(data: responseData, encoding: .utf8)!
            dump(jsonString)
            
            self.parseJsonDataToSuperTV(fromData: responseData)
            //success
            
            //completionHandler(responseData, nil)
        })
        
        task.resume()
    }
    
    private func parseJsonDataToSuperTV(fromData: Data) {

        let decoder = JSONDecoder()
        
        //format: "2017-01-16T20:19:32Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let superTV = try! decoder.decode(SuperTV.self, from: fromData)
        
        dump(superTV)
    }
}
