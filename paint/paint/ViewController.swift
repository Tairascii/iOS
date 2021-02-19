//
//  ViewController.swift
//  paint
//
//  Created by Tair Sairanbekov on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cust: CustomView!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var clearB: UIButton!
    @IBAction func circleB(_ sender: UIButton) {
        cust.setModel(modell: "circ")
    }
    @IBAction func rectB(_ sender: UIButton) {
        cust.setModel(modell: "rect")
    }
    @IBAction func lineB(_ sender: UIButton) {
        cust.setModel(modell: "line")
    }
    @IBAction func triagB(_ sender: UIButton) {
        cust.setModel(modell: "triag")
    }
    @IBAction func penB(_ sender: UIButton) {
        cust.setModel(modell: "pen")
    }
    @IBAction func color(_ sender: UIButton) {
        cust.setColor(colorr: sender.backgroundColor!)
    }
    @IBAction func undoB(_ sender: UIButton) {
        
    }
    @IBAction func fillS(_ sender: UISwitch) {
        cust.setFilled(Filled: sender.isOn)
        
    }
    @objc func undo() {
        cust.undoDraw()
    }

    @objc func clearAll() {
        cust.clearView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (undo))
        let longGesture = UILongPressGestureRecognizer(target: self, action:  #selector(clearAll))
        tapGesture.numberOfTapsRequired = 1
        btn.addGestureRecognizer(tapGesture)
        btn.addGestureRecognizer(longGesture)
        // Do any additional setup after loading the view.
    }


}

