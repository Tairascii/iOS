//
//  InfoViewController3.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 12.03.2021.
//

import UIKit

class InfoViewController3: UIViewController {
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var bodyL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    var body: String?
    var titled: String?
    var dated: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyL.numberOfLines = 0
        bodyL.lineBreakMode = .byWordWrapping
        bodyL.text = body
        titleL.text = titled
        dateL.text = dated
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
