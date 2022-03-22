//
//  ActivitiesTableViewController.swift
//  NotBored
//
//  Created by Sofia Belen Delgado Gonzalez on 21/3/22.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
    var participants: Int = 0
    var data: ([Activity], Int) = ([], 0)
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aqui hace el llamado viewDidLoad")
        data = getData(participants)
        registerTableViewCells()
        activitiesTableView.reloadData()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ActivityTableViewCell",bundle: nil)
        self.activitiesTableView.register(textFieldCell, forCellReuseIdentifier: "activityCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of cells \(data.1)")
        return data.1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        
//        Activity.getActivity(1, type: .cooking, completion: { result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let activity):
//                print(activity)
//            }
//        })
        let activity = data.0[indexPath.row]
        cell.update(activity: activity)
        return cell
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    func getData(_ participants: Int ) -> ( data: [Activity], count: Int ){
        let data = Activity.getActivityList(participants)
        let number = data.count
        print("numero getData \(number)")
        return (data, number)
        
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

