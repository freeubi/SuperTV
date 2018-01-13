//
//  ViewController.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var channelCollectionView: UICollectionView!
    
    // MARK: - Properties
    var superTVManager: SuperTVDataManager? = nil
    var superTVData: SuperTV? = nil
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.channelCollectionView.delegate = self
        self.channelCollectionView.dataSource = self
        
        self.superTVManager = SuperTVDataManager()
        
        self.superTVManager!.getChannelData {
            [weak self] (result, error) in
            
            guard let superTV = result else {
                //error while getChannelData
                dump(error)
                return
            }
            
            self?.superTVData = superTV
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let myCell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: "showCollectionCell", for: indexPath as IndexPath) as! ShowCollectionViewCell

        if let superTVData = self.superTVData {
            if let channels = superTVData.channels {
                if let programmesForCell = channels[indexPath.row].programme {
                    
                    myCell.setContentData(showName: programmesForCell.first!.title!, startDate: programmesForCell.first!.start_date!)
                }
            }
        }
        
        return myCell
    }
    
}

