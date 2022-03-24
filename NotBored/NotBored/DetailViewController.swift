//
//  DetailViewController.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    var activitiesModel = ActivitiesModel()
    var homeVC = HomeViewController()
    var activitiesTableView = ActivitiesTableViewController()
    var type: String = ""
    var participants: Int = 0

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var accesibilityLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accesibilityTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        type = activitiesTableView.category
        print(participants)
        setDetailView(participants: participants, type: type)
        }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
//        setDetailView()
    }

    func setDetailView(participants: Int, type: String) {
        getData(participants, type: type, completion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let activity):
                    print(activity)
                    
                    self.activityLabel.text = activity.activity
                    self.participantsLabel.text = String(activity.participants)
                    self.priceLabel.text = String(activity.price)
                    self.linkLabel.text = activity.link
                    self.typeLabel.text = activity.type
                    if let accesibility = activity.accesibility {

                        self.accesibilityLabel.text = String(accesibility)
                    } else {
                        self.accesibilityLabel.isHidden = true
                        self.accesibilityTitleLabel.isHidden = true
                    }
                    
                }
            })
        }
}
