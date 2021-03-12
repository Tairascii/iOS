//
//  FacViewController.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 10.03.2021.
//

import UIKit

class FacViewController: UITableViewController {
    @IBOutlet var facTable: UITableView!
    var facultie:[Fac] = [Fac.init("FIT", "Faculty of Information Technologies", UIImage.init(named: "computer")!, "https://kbtu.edu.kz/en/faculties/faculty-of-information-technology-2"),Fac.init("FEOGI", "Faculty of Energy and Oil and Gas Industry", UIImage.init(named: "oil")!, "https://kbtu.edu.kz/en/faculties/faculty-of-energy-and-oil-and-gas-industry-2"),Fac.init("FGE", "Faculty of General Education", UIImage.init(named: "book")!, "https://kbtu.edu.kz/en/faculties/bazovyj-fakultet-2"),Fac.init("BS", "Business School", UIImage.init(named: "money")!, "https://kbtu.edu.kz/en/faculties/school-of-business-2"),Fac.init("KMA", "Kazakhstan Maritime Academy", UIImage.init(named: "ship")!, "https://kbtu.edu.kz/en/faculties/kazakhstan-maritime-academy-2"),Fac.init("SCE", "School of Chemical Engineering", UIImage.init(named: "chemistry")!, "https://kbtu.edu.kz/en/faculties/scientific-and-educational-center-of-chemical-engineering-2"),Fac.init("FGE", "Faculty of Geology and Exploration", UIImage.init(named: "globe")!, "https://kbtu.edu.kz/en/faculties/faculty-of-geology-and-exploration-2"),Fac.init("SMC", "School of Mathematic and Cybernetics", UIImage.init(named: "math")!, "https://kbtu.edu.kz/en/faculties/research-and-educational-center-for-mathematics-and-cybernetics-2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Faculties"
        self.facTable.backgroundColor = .systemPurple
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return facultie.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacCell") as? CustomCell2
        cell?.abb.text = facultie[indexPath.row].abb
        cell?.desc.text = facultie[indexPath.row].desc
        cell?.img.image = facultie[indexPath.row].image
        return cell!
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowInfo2"{
            if let navcon = segue.destination as? InfoViewController2{
                navcon.link = facultie[(facTable.indexPathForSelectedRow?.row)!].link
            }
        }
    }
}
