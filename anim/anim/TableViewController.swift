//
//  TableViewController.swift
//  anim
//
//  Created by Tair Sairanbekov on 01.04.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var phone : [Phone] = [Phone(name: "iPhone 7 Plus", price: "350$", desc1: "A10 Fusion", desc2: "12MPX"), Phone(name: "Samsung Galaxy S8", price: "500$", desc1: "Snapdragon 835", desc2: "12MPX"), Phone(name: "LG G4", price: "400$", desc1: "Snapdragon 808", desc2: "16MPX"), Phone(name: "Nexus 6P", price: "700$", desc1: "Snapdragon 810", desc2: "12.3MPX"), Phone(name: "HTC One M9", price: "500$", desc1: "Snapdragon 810", desc2: "20MPX"), Phone(name: "Google Pixel", price: "650$", desc1: "Snapdragon 821", desc2: "12MPX")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phone.count
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.nameL.text = phone[indexPath.row].name
        cell?.priceL.text = phone[indexPath.row].price
        cell?.desc1L.text = phone[indexPath.row].desc1
        cell?.desc2L.text = phone[indexPath.row].desc2
        cell?.hideBApp()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.5 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            })
    }
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        myTable.separatorStyle = .none
        myTable.reloadData()
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
