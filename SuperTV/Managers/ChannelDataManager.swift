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
    let data = URL(string:"https://gist.github.com/reden87/0fa57b0f4b3f16efa52b553359c29832")
    
    // MARK: - Init
    override init() {
        
    }
    
    func getChannelData() {
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode("")
        print(String(data: data, encoding: .utf8)!)
        
    }
}
