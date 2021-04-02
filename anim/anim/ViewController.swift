//
//  ViewController.swift
//  anim
//
//  Created by Tair Sairanbekov on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailF: UITextField!
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var passF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextB.layer.borderWidth = 1
        nextB.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        nextB.layer.cornerRadius = 13
        emailF.placeholder = "Email"
        passF.placeholder = "Password"
        emailF.layer.position.x -= 400
        passF.layer.position.x += 400
        UIView.animate(withDuration: 1){
            self.emailF.center = CGPoint(x: self.emailF.layer.position.x+400, y: self.emailF.layer.position.y)
            self.passF.center = CGPoint(x: self.passF.layer.position.x-400, y: self.passF.layer.position.y)
        }
        UIView.animate(withDuration: 1, delay: 1) {
            self.nextB.alpha = 1
        }
    }
    
    @IBAction func nextB(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5){
            self.emailF.center = CGPoint(x: self.emailF.layer.position.x-400, y: self.emailF.layer.position.y)
            self.passF.center = CGPoint(x: self.passF.layer.position.x+400, y: self.passF.layer.position.y)
            
        }
    }
    

}

