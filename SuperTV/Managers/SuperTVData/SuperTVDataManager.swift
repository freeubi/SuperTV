//
//  ChannelDataManager.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

class SuperTVDataManager: NSObject, SuperTVDataManagerProtocol {

    // MARK: - Properties
    private let dataURL = URL(string:"https://gist.githubusercontent.com/reden87/ad856e7994b8ea93ac27503ecb051347/raw/050c539749f3d253a01ad685983ebc8503ea7872/example.json")
    
    enum SuperTVDataError: Error {
        case noData
        case errorWhileParseJson
    }
    
    // MARK: - Public methods
    public func getChannelData(completionHandler: @escaping (SuperTV?, Error?) -> Void) {
        
        self.getJsonFromUrl(url: dataURL!) {
            [weak self] (result, error) in
            
            guard let jsonResult = result else {
                //error while downloading json
                completionHandler(nil, error)
                return
            }
            
            guard let parsedData = self?.parseJsonDataToSuperTV(fromData: jsonResult) else {
                //json parse error
                completionHandler(nil,SuperTVDataError.errorWhileParseJson)
                return
            }
                
            completionHandler(parsedData, nil)
        }        
    }
    
    // MARK: - Private methods
    private func getJsonFromUrl(url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            
            // check for standard errors
            guard error == nil else {
                completionHandler(nil, error!)
                return
            }
            
            // make sure we got data in the response
            guard let responseData = data else {
                print("Error: did not receive data from url: " + url.absoluteString)
                
                completionHandler(nil, SuperTVDataError.noData)
                return
            }
            
            //success
            completionHandler(responseData, nil)
        })
        
        task.resume()
    }
    
    private func parseJsonDataToSuperTV(fromData: Data) -> SuperTV? {

        let decoder = JSONDecoder()
        
        //format: "2017-01-16T20:19:32Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        if let superTV = try? decoder.decode(SuperTV.self, from: fromData) {
            
            dump(superTV)
            return superTV
        }else {
            
            return nil
        }
    }
}
