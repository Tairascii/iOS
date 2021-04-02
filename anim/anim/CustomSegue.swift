//
//  CustomSegue.swift
//  anim
//
//  Created by Tair Sairanbekov on 31.03.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let destView = self.destination.view
        let sourceView = self.source.view
        let containerView = sourceView?.superview
        let originalCenter = sourceView!.center
        
        destView!.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        destView!.center = originalCenter
        containerView?.addSubview(destView!)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { destView!.transform = CGAffineTransform.identity
        }, completion: { success in
            self.source.present(self.destination, animated: false, completion: nil)
        })
    }
}
