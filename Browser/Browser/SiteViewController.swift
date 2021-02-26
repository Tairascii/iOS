//
//  SiteViewController.swift
//  Browser
//
//  Created by Tair Sairanbekov on 25.02.2021.
//

import UIKit
import WebKit
import SwiftUI
class SiteViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @objc func fav(){
        
        BrowserViewController.browsers[ind].isFav = !BrowserViewController.browsers[ind].isFav
        if BrowserViewController.browsers[ind].isFav{
            myView.backgroundColor = .yellow
        }
        else{
            myView.backgroundColor = .white
        }
        
        
    }
    @IBOutlet weak var website: WKWebView!
    var lnk: String?
    var bc: UIColor?
    var ind: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeLink = lnk{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fav))
            tapGesture.numberOfTapsRequired = 3
            myView.addGestureRecognizer(tapGesture)
            let url = URL(string: safeLink)
            website.load(URLRequest(url: url!))
        }
        myView.backgroundColor = bc
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBack"{
            print("hello")
        }
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
