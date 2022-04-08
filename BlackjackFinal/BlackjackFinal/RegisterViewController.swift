//
//  RegisterViewController.swift
//  BlackjackFinal
//
//  Created by w0454603 on 2022-04-08.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Dismiss Keyboard
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Button Func

    @IBAction func buttonLogin(_ sender: UIButton) {
        let userName = nameTxtField.text;
        
        let msg = "\(userName!)";
        
        
        
        let alert = UIAlertController(title: "Welcome", message: msg, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil);
        alert.addAction(dismissAction);
        
        present(alert, animated: true, completion: nil);
        //TODO setup core data to save user name.
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
