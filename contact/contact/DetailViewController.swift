//
//  DetailViewController.swift
//  contact
//
//  Created by Tair Sairanbekov on 11.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameSurnameLabel: UILabel!
    private var cont = contacs()
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var phonk: UILabel!
    var nameSurname: String?
    var phoneNumber: String?
    var image: UIImage?
    var myTable: UITableView!
    var conts: contacs!
    override func viewDidLoad() {
        nameSurnameLabel.text = nameSurname
        phonk.text = phoneNumber
        img.image = image
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteB(_ sender: UIButton) {
        conts.deleteCont(0)
        myTable.reloadData()
        navigationController?.popViewController(animated: true)
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
