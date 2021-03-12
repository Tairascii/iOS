//
//  AboutViewController.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 10.03.2021.
//

import UIKit

class AboutViewController: UITableViewController {
    @IBOutlet var myTableView: UITableView!
    var info:[about] = [about.init("Rector's Welcome Message", "https://kbtu.edu.kz/en/about-university/rector-s-welcome"), about.init("School of well-doing", "https://kbtu.edu.kz/en/about-university/school-of-well-doing"), about.init("Rector reports", "https://kbtu.edu.kz/en/about-university/rector-reports"), about.init("Procurement", "https://kbtu.edu.kz/en/about-university/procurement"), about.init("History", "https://kbtu.edu.kz/en/about-university-2/history"), about.init("Vision, Mission and Strategic Goals", "https://kbtu.edu.kz/en/about-university-2/vision-mission-and-strategic-goals"), about.init("Executive Leadership", "https://kbtu.edu.kz/en/about-university-2/administration"), about.init("Advisory Board", "https://kbtu.edu.kz/en/about-university-2/advisory-board-4"), about.init("Office of the Registrar", "https://kbtu.edu.kz/en/about-university-2/ofis-registratora-3"), about.init("Human Resource Department", "https://kbtu.edu.kz/en/about-university-2/human-resource-department"), about.init("Quality Assurance & Engancement", "https://kbtu.edu.kz/en/about-university-2/quality-assurance-enhancement"), about.init("Managment Structure", "https://kbtu.edu.kz/en/about-university-2/managment-structure-en"), about.init("Endowment Fund", "https://kbtu.edu.kz/en/about-university-2/endowment-foundation-4"), about.init("Contacts", "https://kbtu.edu.kz/en/about-university-2/menedzhment-kontakty-2")]
    override func viewDidLoad() {
        navigationItem.title = "About Us"
        self.myTableView.backgroundColor = .systemPurple
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = info[indexPath.row].title
        return cell
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
        if segue.identifier == "showInfo"{
            if let navcon = segue.destination as? InfoViewController{
                navcon.link = info[(myTableView.indexPathForSelectedRow?.row)!].body
            }
        }
    }

}
