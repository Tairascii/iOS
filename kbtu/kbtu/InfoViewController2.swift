//
//  InfoViewController2.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 10.03.2021.
//

import UIKit
import WebKit
class InfoViewController2: UIViewController {

    @IBOutlet weak var website: WKWebView!
    var link: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeLink = link{
            let url = URL(string: safeLink)
            website.load(URLRequest(url: url!))
        }
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
