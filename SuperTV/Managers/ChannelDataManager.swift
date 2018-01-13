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
    let dataURL = URL(string:"https://gist.github.com/reden87/0fa57b0f4b3f16efa52b553359c29832")
    
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
            
            dump(responseData)
            
            //success
            
            //completionHandler(responseData, nil)
        })
        
        task.resume()
    }
    
    private func parseJsonDataToSuperTV(jsonString: String) {

/*
        let encoder = JSONEncoder()
        
        let data = try encoder.encode(jsonString)
        
        //print(String(data: data, encoding: .utf8)!)*/
    }
}
