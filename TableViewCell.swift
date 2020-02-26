//
//  TableViewCell.swift
//  TablaGuitarrasDI
//
//  Created by andres on 26/02/2020.
//  Copyright © 2020 andres. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
