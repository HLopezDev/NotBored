//
//  DetailViewController.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var activity: Activity? = nil

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var accesibilityLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accesibilityTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetailView()
        
        }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
        setDetailView()
    }
    
    func setDetailView() {
        
        Activity.getActivity(completion: { result in
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
        
        
        
        

        // Do any additional setup after loading the view.
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
