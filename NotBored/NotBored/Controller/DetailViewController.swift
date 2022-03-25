//
//  DetailViewController.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import UIKit

class DetailViewController: UIViewController {

    var type: String = ""
    var participants: Int = 0

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var accesibilityLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accesibilityTitleLabel: UILabel!
    
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var participantsTitleLabel: UILabel!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        showView()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showView()
    }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
        showView()
    }

    func showActivity(_ activity: Activity) {
        self.activityLabel.text = activity.activity
        self.participantsLabel.text = String(activity.participants)
        self.priceLabel.text = String(activity.price)
        self.linkLabel.text = activity.link
        self.typeLabel.text = "✅ " + activity.type
        if let accesibility = activity.accesibility {
            
            self.accesibilityLabel.text = String(accesibility)
        } else {
            self.accesibilityLabel.isHidden = true
            self.accesibilityTitleLabel.isHidden = true
        }
        print("showActivity\(activityLabel)")
    }
    
    func noActivityAvailable() {
        self.activityLabel.text = "Sorry! No activity found with the specified parameters, try again"
        self.participantsLabel.isHidden = true
        self.priceLabel.isHidden = true
        self.linkLabel.isHidden = true
        self.typeLabel.isHidden = true
        self.accesibilityLabel.isHidden = true
        self.accesibilityTitleLabel.isHidden = true
        self.participantsTitleLabel.isHidden = true
        self.priceTitleLabel.isHidden = true
    }
    
    func activityData(participants: Int, type: String) {
        DataService.getData(participants, type: type, completion: { result in
                switch result {
                case .failure(let error):
                    self.noActivityAvailable()
                    print(error)
                case .success(let activity):
                    self.prepareUI()
                    print(activity)
                    self.showActivity(activity)
                }
            })
        }
    
    func randomActivityData(_ participants: Int) {
        DataService.getRandomData(participants, completion: { result in
                switch result {
                case .failure(let error):
                    self.noActivityAvailable()
                    print(error)
                case .success(let activity):
                    self.prepareUI()
                    print(activity)
                    self.showActivity(activity)
                }
            })
        }
    
    
    
    func prepareUI() {
        self.participantsLabel.isHidden = false
        self.priceLabel.isHidden = false
        self.linkLabel.isHidden = false
        self.typeLabel.isHidden = false
        self.accesibilityLabel.isHidden = false
        self.accesibilityTitleLabel.isHidden = false
        self.participantsTitleLabel.isHidden = false
        self.priceTitleLabel.isHidden = false
    }
    
    func showView() {
        if type == "" {
            self.title = "Random"
            randomActivityData(participants)
        } else {
            self.title = type.capitalized
            activityData(participants: participants, type: type)
        }
    }
}
