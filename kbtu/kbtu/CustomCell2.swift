//
//  CustomCell2.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 10.03.2021.
//

import UIKit

class CustomCell2: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var abb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
