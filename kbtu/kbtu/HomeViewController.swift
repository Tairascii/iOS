//
//  HomeViewController.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 10.03.2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        b1.layer.borderWidth = 2
        b1.layer.borderColor = .init(red: 140, green: 0, blue: 140, alpha: 1)
        b1.layer.cornerRadius = 15
        b2.layer.borderWidth = 2
        b2.layer.borderColor = .init(red: 140, green: 0, blue: 140, alpha: 1)
        b2.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
