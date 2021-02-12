//
//  ViewController.swift
//  contact
//
//  Created by Tair Sairanbekov on 11.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cont:contacs=contacs()
    var contactss:[newCont] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = contactss[indexPath.row].name_surname
        cell?.contactNumber.text = contactss[indexPath.row].phoneNumber
        cell?.contactImage.image = contactss[indexPath.row].image
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        cont.addCont("Tair2", "877777", "female")
        contactss = cont.getRes()
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailViewController {
            dest.nameSurname = contactss[(myTableView.indexPathForSelectedRow?.row)!].name_surname
            dest.phoneNumber = contactss[(myTableView.indexPathForSelectedRow?.row)!].phoneNumber
            dest.image = contactss[(myTableView.indexPathForSelectedRow?.row)!].image
            dest.myTable = myTableView
            dest.conts = cont
        }
        else {
            
        }
    }


}

