//
//  ViewController.swift
//  faceRecognization
//
//  Created by parvana on 28.06.25.
//
import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinClicked(_ sender: Any) {
        let autoContext = LAContext()
        var error : NSError?
        if autoContext.canEvaluatePolicy( .deviceOwnerAuthenticationWithBiometrics , error: &error ) {
            autoContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you ") { success , error in
                if success == true {
                    // successful auth
                    DispatchQueue.main.async {
                       self.performSegue(withIdentifier: "toSecondVC", sender: nil)

                    }
                } else {
                    DispatchQueue.main.async {
                        self.label.text = "Error!"

                    }
                }
            }
        }
    }
    
    
}

