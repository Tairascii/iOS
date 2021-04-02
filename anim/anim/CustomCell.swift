//
//  CustomCell.swift
//  anim
//
//  Created by Tair Sairanbekov on 01.04.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cell1: UIView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    @IBOutlet weak var cell2: UIView!
    @IBOutlet weak var desc1L: UILabel!
    @IBOutlet weak var desc2L: UILabel!
    @IBOutlet weak var hideB: UIButton!
    var cnt = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func hideBApp(){
        hideB.layer.borderWidth = 1
        hideB.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        hideB.layer.cornerRadius = 10
    }
    @IBAction func hideB(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.cell2.center = CGPoint(x: self.cell2.layer.position.x+400, y: self.cell2.layer.position.y)
            self.cell2.alpha = 0
        } completion: { (Bool) in
            self.cell2.alpha =  1
            self.cell2.center = CGPoint(x: self.cell2.layer.position.x, y: self.cell2.layer.position.y)
            self.cell2.isHidden = true
        }
    }
    
    @IBAction func infoB(_ sender: UIButton) {
        if self.cnt == 0{
            self.cell2.center = CGPoint(x: self.cell2.layer.position.x, y: self.cell2.layer.position.y)
            self.cnt += 1
        }
        else{
            self.cell2.center = CGPoint(x: self.cell2.layer.position.x-400, y: self.cell2.layer.position.y)
        }
        UIView.transition(with: cell2, duration: 0.3, options: .transitionFlipFromLeft) {
            self.cell2.isHidden = false
        }
    }
}
