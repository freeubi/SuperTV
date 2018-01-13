//
//  SuperTVDataManagerProtocol.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

protocol SuperTVDataManagerProtocol {
    
    func getChannelData(completionHandler: @escaping (SuperTV?, Error?) -> Void)
}
