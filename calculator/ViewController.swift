//
//  ViewController.swift
//  calculator
//
//  Created by Tair Sairanbekov on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    var dotExists:Bool = false
    var typing:Bool = false
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPlus: UIButton!
    @IBOutlet weak var myMinus: UIButton!
    @IBOutlet weak var myUmi: UIButton!
    @IBOutlet weak var myDel: UIButton!
    @IBOutlet weak var myProc: UIButton!
    @IBOutlet weak var myC: UIButton!
    @IBOutlet weak var my1: UIButton!
    @IBOutlet weak var my2: UIButton!
    @IBOutlet weak var my3: UIButton!
    @IBOutlet weak var my4: UIButton!
    @IBOutlet weak var my5: UIButton!
    @IBOutlet weak var my6: UIButton!
    @IBOutlet weak var my7: UIButton!
    @IBOutlet weak var my8: UIButton!
    @IBOutlet weak var my9: UIButton!
    @IBOutlet weak var my0: UIButton!
    @IBOutlet weak var myDot: UIButton!
    @IBOutlet weak var myPlusMinus: UIButton!
    private var calcmodel=calculatorModel()
    @IBOutlet weak var myDisp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = 38
        myUmi.layer.cornerRadius = 38
        myDel.layer.cornerRadius = 38
        myPlus.layer.cornerRadius = 38
        myMinus.layer.cornerRadius = 38
        my1.layer.cornerRadius = 38
        my2.layer.cornerRadius = 38
        my3.layer.cornerRadius = 38
        my4.layer.cornerRadius = 38
        my5.layer.cornerRadius = 38
        my6.layer.cornerRadius = 38
        my7.layer.cornerRadius = 38
        my8.layer.cornerRadius = 38
        my9.layer.cornerRadius = 38
        my0.layer.cornerRadius = 38
        myDot.layer.cornerRadius = 38
        myC.layer.cornerRadius = 38
        myPlusMinus.layer.cornerRadius = 38
        myProc.layer.cornerRadius = 38
        
        // Do any additional setup after loading the view.
    }
    var dispValue:Double{
        get{
            return Double(myDisp.text!)!
        }
        set{
            myDisp.text = String(newValue)
        }
    }
    @IBAction func digitB(_ sender:
                            UIButton) {
        if myDisp.text!.count>4{
            myDisp.font = myDisp.font.withSize(50)
        }
        else{
            myDisp.font = myDisp.font.withSize(100)
        }
        if myDisp.text!.count<10{
            let current_digit = sender.currentTitle!
            if typing{
            
            let current_display = myDisp.text!
            myDisp.text = current_display + current_digit
            }
            else{
                myDisp.text=current_digit
                typing=true
            }
        }
        
    }
    
    @IBAction func dott(_ sender: UIButton) {
        
        if !dotExists{
            let current_display = myDisp.text!
            myDisp.text = current_display + sender.currentTitle!
            dotExists=true
            typing=true
            
        }
        
    }
    @IBAction func operation(_ sender: UIButton) {
        calcmodel.setOperand(dispValue)
        calcmodel.performOperation(sender.currentTitle!)
        dispValue=calcmodel.getRes()!
        typing=false
        if dispValue.truncatingRemainder(dividingBy: 1)==0{
            dotExists=false
        }
        else{
            dotExists=true
        }
    }
    
    @IBAction func deleteEv(_ sender: UIButton) {
        myDisp.font = myDisp.font.withSize(100)
        typing=false
        dotExists=false
        myDisp.text="0"
        calcmodel.setOperand(dispValue)
    }
    
    
}

