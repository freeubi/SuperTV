//
//  SuperTV.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

public struct SuperTV: Codable {

    //test json: {"channels":[{"id":0,"title":"CHANNEL 1","programme":[{"title":"Ab Dolorem Sapiente Et","end_date":"2017-01-15T23:46:50Z","start_date":"2017-01-15T23:00:00Z"},{"title":"Voluptatem Vero Itaque","end_date":"2017-01-16T00:36:54Z","start_date":"2017-01-15T23:46:50Z"}]}]}
    
    let channels: [Channels]?
    
    enum CodingKeys: String, CodingKey {
        case channels = "channels"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        channels = try values.decodeIfPresent([Channels].self, forKey: .channels)        
    }    
}
