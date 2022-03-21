




//
//  HomeViewController.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var participantsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
//        Activity.getActivity(completion: { result in
//            switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let activity):
//                    let activity = activity
//                    print(activity)
//            }
//        })
    }
    
    @IBAction func termsAndConditionsButton(_ sender: UIButton) {
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditionsViewController", bundle: nil)
        self.present(vc, animated: true)
    }
    
    
    

}
