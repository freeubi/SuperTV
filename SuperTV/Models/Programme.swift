//
//  Show.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

public struct Programme: Codable {
    
    //test json: {"title":"Ab Dolorem Sapiente Et","end_date":"2017-01-15T23:46:50Z","start_date":"2017-01-15T23:00:00Z"}
    
    let title : String?
    let start_date : Date?
    let end_date : Date?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case start_date = "start_date"
        case end_date = "end_date"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decodeIfPresent(String.self, forKey: .title)
        start_date = try values.decodeIfPresent(Date.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(Date.self, forKey: .end_date)
        
    }
}
