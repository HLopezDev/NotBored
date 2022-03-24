//
//  ActivitiesTableViewController.swift
//  NotBored
//
//  Created by Sofia Belen Delgado Gonzalez on 21/3/22.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
    var activitiesModel = ActivitiesModel()
    var categories : [String] = []
    var category: String = ""
    var participants: Int = 0
    var vcDetail = DetailViewController()
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        categories = activitiesModel.getCategory()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ActivityTableViewCell",bundle: nil)
        self.activitiesTableView.register(textFieldCell, forCellReuseIdentifier: "activityCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        cell.typeLabel.text = categories[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
        category = categories[indexPath.row]
        vcDetail.type = category
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
