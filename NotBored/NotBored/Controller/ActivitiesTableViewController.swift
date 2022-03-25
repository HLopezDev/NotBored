//
//  ActivitiesTableViewController.swift
//  NotBored
//
//  Created by Sofia Belen Delgado Gonzalez on 21/3/22.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
//    var activitiesModel = ActivitiesModel()
    var categories : [String] = []
    var category: String = ""
//    var participants: Int = 0
    var vcDetail: DetailViewController!
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let shuffleImage = UIImage(systemName: "shuffle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: shuffleImage, style: .plain, target: self, action: #selector(self.randomActivity))
        registerTableViewCells()
        categories = ActivitiesModel.getCategory()
        self.title = "Activities"
        print("In Detail viewdidload \(vcDetail.participants)")
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
        cell.typeLabel.text = categories[indexPath.row].capitalized
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
        category = categories[indexPath.row]
        vcDetail.type = category
//        vcDetail.participants = participants
        print("In tap tableview \(vcDetail.type) y participants \(vcDetail.participants)")
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
    
    @objc func randomActivity() {
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}