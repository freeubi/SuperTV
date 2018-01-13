//
//  Channels.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import Foundation

public struct Channels : Codable {
    
    //test json: [{"id":0,"title":"CHANNEL 1","programme":[{"title":"Ab Dolorem Sapiente Et","end_date":"2017-01-15T23:46:50Z","start_date":"2017-01-15T23:00:00Z"},{"title":"Voluptatem Vero Itaque","end_date":"2017-01-16T00:36:54Z","start_date":"2017-01-15T23:46:50Z"}]}
    
    let id : Int?
    let title : String?
    let programme : [Programme]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case programme = "programme"
    }
    
    public init(from decoder: Decoder) throws {
         let values = try decoder.container(keyedBy: CodingKeys.self)
        
         id = try values.decodeIfPresent(Int.self, forKey: .id)
         title = try values.decodeIfPresent(String.self, forKey: .title)
         programme = try values.decodeIfPresent([Programme].self, forKey: .programme)
    }
    
}
