//
//  ActivityTableViewCell.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/6/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
        @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
