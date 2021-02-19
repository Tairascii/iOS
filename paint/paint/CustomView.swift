//
//  CustomView.swift
//  paint
//
//  Created by Tair Sairanbekov on 18.02.2021.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    var color: UIColor = .black
    var model: String = "line"
    var isFilled: Bool = true
    var models: [AnyObject] = []
    override func draw(_ rect: CGRect) {
        for i in models{
            if i is Line{
                let line = i as! Line
                line.drawPath()
            }
            else if i is Rectangle{
                let rect = i as! Rectangle
                rect.drawPath()
            }
            else if i is Triangle{
                let triag = i as! Triangle
                triag.drawPath()
            }
            else if i is Circle{
                let circ = i as! Circle
                circ.drawPath()
            }
        }
        
    }
    func addMod(){
        switch model {
        case "line":
            if let p1 = point1{
                models.append(Line(p1: p1, p2: point2, color: color, stroke_width: 3))
                
            }
        case "rect":
            if let p1 = point1{
                models.append(Rectangle(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: isFilled))
                
            }
        case "circ":
            if let p1 = point1{
                models.append(Circle(with: (p1.x-point2.x)/2, and: point2, withSome: color, and: 3, isFilled: isFilled))
                
            }
        case "triag":
            if let p1 = point1{
                models.append(Triangle(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: isFilled))
                
            }
        case "pen":
            if let p1 = point1{
                models.append(Line(p1: p1, p2: point2, color: color, stroke_width: 3))
            }
            
        default:
            break
        }
    }
    func setModel(modell:String){
        model = modell
    }
    func setFilled(Filled:Bool){
        isFilled = Filled
    }
    func setColor(colorr: UIColor){
        color = colorr
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            if model == "pen"{
                point2 = touch.location(in: self)
                addMod()
                point1 = point2
                setNeedsDisplay()
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        addMod()
        setNeedsDisplay()
    }
    func clearView(){
        models.removeAll()
        setNeedsDisplay()
    }
    func undoDraw(){
        if models.count>0{
            models.removeLast()
        }
        
        setNeedsDisplay()
    }
    

}

