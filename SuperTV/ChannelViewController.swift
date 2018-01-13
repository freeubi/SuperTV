//
//  ViewController.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getChannelData(_ sender: Any) {
        
        let superTVManager = SuperTVDataManager()
        
        superTVManager.getChannelData {
            (result, error) in
            
            guard let superTV = result else {
                //error while getChanelData
                
                dump(error)
                return
            }
            
            
        }
        
    }
}

