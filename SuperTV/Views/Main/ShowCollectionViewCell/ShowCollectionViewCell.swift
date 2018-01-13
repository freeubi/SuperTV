//
//  ShowCollectionViewCell.swift
//  SuperTV
//
//  Created by Jandzso Zsolt on 2018. 01. 13..
//  Copyright © 2018. Jandzso Zsolt. All rights reserved.
//

import UIKit

class ShowCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    
    // MARK: - Properties
    var showName: String?
    var startTime: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContentData(showName: String, startDate: Date) {
        
        self.showName = showName
        self.startTime = startDate
        
        setContent()
    }
    
    private func setContent() {
        
        if let showName = self.showName {
            self.showNameLabel.text = showName
        }
        
        if let time = self.startTime {
            let hour = Calendar.current.component(.hour, from: time)
            let minute = Calendar.current.component(.minute, from: time)
            
            self.timeLabel.text = String(hour) + ":" + String(minute)
        }
    }
}
