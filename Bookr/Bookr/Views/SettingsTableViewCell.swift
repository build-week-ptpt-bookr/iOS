//
//  SettingsTableViewCell.swift
//  Bookr
//
//  Created by Aaron on 8/21/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    var setting: SettingsModel? {
        didSet {
            updateValues()
        }
    }
    
    func updateValues() {
        settingLabel.text = setting?.title
        
    }
    
    

    

}
