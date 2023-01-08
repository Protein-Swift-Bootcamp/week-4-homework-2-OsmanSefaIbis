//
//  WeatherCell.swift
//  Homework2
//
//  Created by Sefa İbiş on 8.01.2023.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var WindLabel: UILabel!
    @IBOutlet weak var FeltTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
