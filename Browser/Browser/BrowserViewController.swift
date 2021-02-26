//
//  BrowserViewController.swift
//  Browser
//
//  Created by Tair Sairanbekov on 25.02.2021.
//

import UIKit

class BrowserViewController: UITableViewController {
    static var browsers: [Browser] = [Browser(name: "Google", link: "https://www.google.ru", isFav: false), Browser(name: "HTLV", link: "https://www.hltv.org", isFav: true)]
    
    var fav: [Browser] = []
    private var lists: [Browser] = []
    private var ind: Int = 0
    var newName: String?
    var newLink: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Websites"
        lists = BrowserViewController.browsers
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row].name
        return cell
    }
    

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

    @IBAction func VCDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            fav=[]
            changeList(BrowserViewController.browsers)
            refresh()
        case 1:
            for br in BrowserViewController.browsers{
                if br.isFav{
                    fav.append(br)
                }
            }
            changeList(fav)
            refresh()
        default:
            break
        }
    }
    
    @IBAction func addB(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add website", message: "Fill all the fields", preferredStyle: .alert)
        let addBtn = UIAlertAction(title: "Add", style: .default, handler: {[self](action) in
                                    let nameField = alert.textFields?.first
                                    let urlField = alert.textFields?.last
            BrowserViewController.browsers.append(Browser(name: nameField?.text, link: urlField?.text, isFav: false))
            self.lists = BrowserViewController.browsers
            refresh()
        })
        alert.addTextField{ (textField) in textField.placeholder = "Enter title"}
        alert.addTextField{ (textField) in textField.placeholder = "Enter url"}
        alert.addAction(addBtn)
        present(alert, animated: true, completion: nil)
    }
    
    func changeList(_ list: [Browser]){
        lists = list
    }
    
    func refresh(){
        tableView.reloadData()
    }
    
    func addFav(_ name: String){
        for br in BrowserViewController.browsers{
            if br.name == name{
                fav.append(br)
                refresh()
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSite"{
            if let navcon = segue.destination as? UINavigationController{
                if let destination = navcon.visibleViewController as? SiteViewController{
                    if let row = tableView.indexPathForSelectedRow?.row{
                        destination.lnk = lists[row].link
                        destination.ind = row
                        destination.navigationItem.title = lists[row].name
                        if lists[row].isFav{
                            destination.bc = .yellow
                        }
                    }
                }
                
                
            }
        }
    }
    

}
