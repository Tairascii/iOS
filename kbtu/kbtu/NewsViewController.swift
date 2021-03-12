//
//  NewsViewController.swift
//  kbtu
//
//  Created by Tair Sairanbekov on 12.03.2021.
//

import UIKit

class NewsViewController: UITableViewController {
    @IBOutlet var newsTable: UITableView!
    var news: [News] = [News.init("25.02.2021", "Preventive work site wsp", "Dear students, the site wsp.kbtu.kz is carrying out preventive work, which can lead to temporary failures."), News.init("15.02.2021", "Canteen is open now", "Appeal: Dear colleagues and students of KBTU, we are pleased to announce that from 15/02/2021 the dining room (canteen) on the basement of the University (floor -1) has been open."), News.init("01.02.2021", "Dear students!", "We are asking to pay for the students fees!"), News.init("26.01.2021", "Dear first - year students!", "The combined training format is compulsory for all 1st year students with the exception of students with signs of COVID-19, pulmonary pneumonia or other viral diseases. These students can continue their studies in an online format, after the permission of the Quality Assurance Committee."), News.init("07.12.2020", "ONLINE PROCTORING", "https://www.kbtu.kz/ru/online-proctoring")]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        self.newsTable.backgroundColor = .systemPurple
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
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = news[indexPath.row].title
        cell.detailTextLabel?.text = news[indexPath.row].date
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
        if segue.identifier == "ShowInfo3"{
            if let navcon = segue.destination as? InfoViewController3{
                navcon.body = news[(newsTable.indexPathForSelectedRow?.row)!].body
                navcon.titled = news[(newsTable.indexPathForSelectedRow?.row)!].title
                navcon.dated = news[(newsTable.indexPathForSelectedRow?.row)!].date
            }
        }
    }

}
