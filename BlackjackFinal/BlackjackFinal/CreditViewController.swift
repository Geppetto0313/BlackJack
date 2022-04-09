//
//  CreditViewController.swift
//  BlackjackFinal
//
//  Created by w0454603 on 2022-04-08.
//

import UIKit

class CreditViewController: UIViewController {

    @IBOutlet weak var specialThanksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        specialThanksLabel.text = "\(GameViewController.shared.specialThanksName)"
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
