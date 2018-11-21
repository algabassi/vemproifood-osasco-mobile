//
//  FoodTableViewCell.swift
//  ChooseFood
//
//  Created by Alexandre Gabassi on 21/11/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var nomePrato: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
