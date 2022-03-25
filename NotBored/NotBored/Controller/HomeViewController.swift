




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
    
    var vc: ActivitiesTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        participantsTextField.delegate = self
        participantsTextField.text = ""
        startButton.isEnabled = false
        
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        startButton.isEnabled = participantsTextField.hasText
    }

    @IBAction func startButton(_ sender: Any) {
        vc = ActivitiesTableViewController()
        vc.vcDetail = DetailViewController()
        getParticipants()
        print("In startButtonPress\(participantsTextField.text ?? "fallo" )")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func termsAndConditionsButton(_ sender: UIButton) {
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditionsViewController", bundle: nil)
        self.present(vc, animated: true)
    }
    
    func getParticipants() {
        let numero = participantsTextField.text ?? "0"
        vc.vcDetail.participants = Int(numero) ?? 0
        return
//        return Int(numero) ?? 0
//        return 1
    }
    
    func doValidation() {
        if participantsTextField.hasText {
            startButton.isEnabled = true
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
// MARK: Restrict textField to only accept numbers.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
      
    
}
