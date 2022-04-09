//
//  GameViewController.swift
//  BlackjackFinal
//
//  Created by w0454603 on 2022-04-08.
//

import UIKit

class GameViewController: UIViewController {
    
    static let shared = GameViewController()
    var specialThanksName = ""
    var card = 0
    var pScore = 0
    var dScore = 0
    var tempStringScore = ""
    var tempIntScore = 0
    var tempStringPoints = ""
    var tempIntPoints = 0
    var hitCounter = 1
        
    @IBOutlet weak var playerPoints: UILabel!
    @IBOutlet weak var buttonHit: UIButton!
    @IBOutlet weak var buttonStay: UIButton!
   
    @IBOutlet weak var buttonRestart: UIButton!
    @IBOutlet weak var buttonStart: UIButton!
    
    
    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerCard5: UIImageView!
    
    @IBOutlet weak var dealerScore: UILabel!
    
    
    @IBAction func btnRestart(_ sender: UIButton) {
        
        buttonRestart.isHidden = true
        buttonStart.isHidden = false
        dealerScore.text = "0"
        playerScore.text = "0"
        playerCard1.image = UIImage(named: "deck_3.png")
        playerCard2.image = UIImage(named: "deck_3.png")
        playerCard3.image = UIImage(named: "deck_3.png")
        playerCard4.image = UIImage(named: "deck_3.png")
        playerCard5.image = UIImage(named: "deck_3.png")
        dealerCard1.image = UIImage(named: "deck_3.png")
        dealerCard2.image = UIImage(named: "deck_3.png")
        dealerCard3.image = UIImage(named: "deck_3.png")
        dealerCard4.image = UIImage(named: "deck_3.png")
        dealerCard5.image = UIImage(named: "deck_3.png")
        
        
    }
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        tempStringPoints = playerPoints.text ?? ""
        tempIntPoints = Int(tempStringPoints) ?? 0
        
        if tempIntPoints >= 50 {
            
            buttonStart.isHidden = true
            buttonHit.isHidden = false
            buttonStay.isHidden = false
            
            playerPoints.text = "500"
            
            card = Int.random(in: 1...52)
            
            let pCard1 = SetCard(c: card)
            playerCard1.image = UIImage(named: "\(pCard1)")
            pScore = GetValue(v: pCard1)
            tempStringScore = playerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += pScore
            playerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            
            card = Int.random(in: 1...52)
            
            let pCard2 = SetCard(c: card)
            playerCard2.image = UIImage(named: "\(pCard2)")
            pScore = GetValue(v: pCard2)
            tempStringScore = playerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += pScore
            playerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            
            card = Int.random(in: 1...52)
            
            let dCard1 = SetCard(c: card)
            dealerCard1.image = UIImage(named: "\(dCard1)")
            dScore = GetValue(v: dCard1)
            tempStringScore = dealerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += dScore
            dealerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            
            card = Int.random(in: 1...52)
            
            let dCard2 = SetCard(c: card)
            dealerCard2.image = UIImage(named: "\(dCard2)")
            dScore = GetValue(v: dCard2)
            tempStringScore = dealerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += dScore
            dealerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
        } else {
            let alert = UIAlertController(title: "NOT ENOUGH POINTS", message: "Time to go back to work!!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil);
            alert.addAction(dismissAction);
            
            present(alert, animated: true, completion: nil);
            
        }
        
    }
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    

    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    
    
    @IBAction func btnHit(_ sender: UIButton) {
        
        switch(hitCounter){
        case 1:
            hitCounter = hitCounter + 1
            card = Int.random(in: 1...52)
            
            let pCard3 = SetCard(c: card)
            playerCard3.image = UIImage(named: "\(pCard3)")
            pScore = GetValue(v: pCard3)
            tempStringScore = playerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += pScore
            playerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            playerCard3.isHidden = false
            PlayerBust()
        case 2:
            hitCounter = hitCounter + 1
            card = Int.random(in: 1...52)
            
            let pCard4 = SetCard(c: card)
            playerCard4.image = UIImage(named: "\(pCard4)")
            pScore = GetValue(v: pCard4)
            tempStringScore = playerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += pScore
            playerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            playerCard4.isHidden = false
            PlayerBust()
        case 3:
            hitCounter = hitCounter + 1
            card = Int.random(in: 1...52)
            
            let pCard5 = SetCard(c: card)
            playerCard5.image = UIImage(named: "\(pCard5)")
            pScore = GetValue(v: pCard5)
            tempStringScore = playerScore.text ?? ""
            tempIntScore = Int(tempStringScore) ?? 0
            tempIntScore += pScore
            playerScore.text = "\(tempIntScore)"
            tempStringScore = ""
            tempIntScore = 0
            playerCard5.isHidden = false
            PlayerBust()
        default:
            print("At Card Limit, Dealers Turn")
            //Call Stay Function

        }
        
    }
    
    @IBAction func btnStay(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerName.text = "\(RegisterViewController.shared.playerName)"
        
        
        let specialThanks = playerName.text
        GameViewController.shared.specialThanksName = "\(specialThanks!)"
       
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func PlayerBust (){
        tempStringScore = playerScore.text ?? ""
        tempIntScore = Int(tempStringScore) ?? 0
        if tempIntScore > 21 {
            buttonHit.isHidden = true;
            buttonStay.isHidden = true;
            
            tempStringPoints = playerPoints.text ?? ""
            tempIntPoints = Int(tempStringPoints) ?? 0
            tempIntPoints = tempIntPoints - 50
            playerPoints.text = "\(tempIntPoints)"
            
            
            let alert = UIAlertController(title: "DEALER WINS!", message: "You busted!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil);
            alert.addAction(dismissAction);
            
            present(alert, animated: true, completion: nil);
        }
        tempStringScore = ""
        tempIntScore = 0
        buttonRestart.isHidden = false
    }
    
    func DealerBust (){
        tempStringScore = dealerScore.text ?? ""
        tempIntScore = Int(tempStringScore) ?? 0
        if tempIntScore > 21 {
            buttonHit.isHidden = true;
            buttonStay.isHidden = true;
            
            tempStringPoints = playerPoints.text ?? ""
            tempIntPoints = Int(tempStringPoints) ?? 0
            tempIntPoints = tempIntPoints + 50
            playerPoints.text = "\(tempIntPoints)"
            
            let alert = UIAlertController(title: "PLAYER WINS", message: "Dealer busted!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil);
            alert.addAction(dismissAction);
            
            present(alert, animated: true, completion: nil);
        }
        tempStringScore = ""
        tempIntScore = 0
    }
    
   func SetCard(c: Int) -> String{
        var newCard = ""
        switch (c) {
        case 1:
            newCard = "card_b_c2.png"
//        //Add values
        case 2:
            newCard = "card_b_c3.png"
        case 3:
            newCard = "card_b_c4.png"
        case 4:
            newCard = "card_b_c5.png"
        case 5:
            newCard = "card_b_c6.png"
        case 6:
            newCard = "card_b_c7.png"
        case 7:
            newCard = "card_b_c8.png"
        case 8:
            newCard = "card_b_c9.png"
        case 9:
            newCard = "card_b_c10.png"
        case 10:
            newCard = "card_b_cj.png"
        case 11:
            newCard = "card_b_cq.png"
        case 12:
            newCard = "card_b_ck.png"
        case 13:
            newCard = "card_b_ca.png"
        case 14:
            newCard = "card_b_d2.png"
        case 15:
            newCard = "card_b_d3.png"
        case 16:
            newCard = "card_b_d4.png"
        case 17:
            newCard = "card_b_d5.png"
        case 18:
            newCard = "card_b_d6.png"
        case 19:
            newCard = "card_b_d7.png"
        case 20:
            newCard = "card_b_d8.png"
        case 21:
            newCard = "card_b_d9.png"
        case 22:
            newCard = "card_b_d10.png"
        case 23:
            newCard = "card_b_dj.png"
        case 24:
            newCard = "card_b_dq.png"
        case 25:
            newCard = "card_b_dk.png"
        case 26:
            newCard = "card_b_da.png"
        case 27:
            newCard = "card_b_h2.png"
        case 28:
            newCard = "card_b_h3.png"
        case 29:
            newCard = "card_b_h4.png"
        case 30:
            newCard = "card_b_h5.png"
        case 31:
            newCard = "card_b_h6.png"
        case 32:
            newCard = "card_b_h7.png"
        case 33:
            newCard = "card_b_h8.png"
        case 34:
            newCard = "card_b_h9.png"
        case 35:
            newCard = "card_b_h10.png"
        case 36:
            newCard = "card_b_hj.png"
        case 37:
            newCard = "card_b_hq.png"
        case 38:
            newCard = "card_b_hk.png"
        case 39:
            newCard = "card_b_ha.png"
        case 40:
            newCard = "card_b_s2.png"
        case 41:
            newCard = "card_b_s3.png"
        case 42:
            newCard = "card_b_s4.png"
        case 43:
            newCard = "card_b_s5.png"
        case 44:
            newCard = "card_b_s6.png"
        case 45:
            newCard = "card_b_s7.png"
        case 46:
            newCard = "card_b_s8.png"
        case 47:
            newCard = "card_b_s9.png"
        case 48:
            newCard = "card_b_s10.png"
        case 49:
            newCard = "card_b_sj.png"
        case 50:
            newCard = "card_b_sq.png"
        case 51:
            newCard = "card_b_sk.png"
        case 52:
            newCard = "card_b_sa.png"
            
        default:
            print("Out of scope")
        }
        
        return newCard
    }
    
    func GetValue(v: String) -> Int{

        var newVal = 0;
         switch (v) {
         case "card_b_c2.png":
            newVal = 2;
         case "card_b_c3.png":
            newVal = 3;
         case "card_b_c4.png":
            newVal = 4;
         case "card_b_c5.png":
            newVal = 5;
         case "card_b_c6.png":
            newVal = 6;
         case "card_b_c7.png":
            newVal = 7;
         case "card_b_c8.png":
            newVal = 8;
         case "card_b_c9.png":
            newVal = 9;
         case "card_b_c10.png":
            newVal = 10;
         case "card_b_cj.png":
            newVal = 10
         case "card_b_cq.png":
            newVal = 10
         case "card_b_ck.png":
            newVal = 10
         case "card_b_ca.png":
            newVal = 1
         case "card_b_d2.png":
            newVal = 2
         case "card_b_d3.png":
            newVal = 3
         case "card_b_d4.png":
            newVal = 4
         case "card_b_d5.png":
            newVal = 5
         case "card_b_d6.png":
            newVal = 6
         case "card_b_d7.png":
            newVal = 7
         case "card_b_d8.png":
            newVal = 8
         case "card_b_d9.png":
            newVal = 9
         case "card_b_d10.png":
            newVal = 10
         case "card_b_dj.png":
            newVal = 10
         case "card_b_dq.png":
            newVal = 10
         case "card_b_dk.png":
            newVal = 10
         case "card_b_da.png":
            newVal = 1
         case "card_b_h2.png":
            newVal = 2
         case "card_b_h3.png":
            newVal = 3
         case "card_b_h4.png":
            newVal = 4
         case "card_b_h5.png":
            newVal = 5
         case "card_b_h6.png":
            newVal = 6
         case "card_b_h7.png":
            newVal = 7
         case "card_b_h8.png":
            newVal = 8
         case "card_b_h9.png":
            newVal = 9
         case "card_b_h10.png":
            newVal = 10
         case "card_b_hj.png":
            newVal = 10
         case "card_b_hq.png":
            newVal = 10
         case "card_b_hk.png":
            newVal = 10
         case "card_b_ha.png":
            newVal = 1
         case "card_b_s2.png":
            newVal = 2
         case "card_b_s3.png":
            newVal = 3
         case "card_b_s4.png":
            newVal = 4
         case "card_b_s5.png":
            newVal = 5
         case "card_b_s6.png":
            newVal = 6
         case "card_b_s7.png":
            newVal = 7
         case "card_b_s8.png":
            newVal = 8
         case "card_b_s9.png":
            newVal = 9
         case "card_b_s10.png":
            newVal = 10
         case "card_b_sj.png":
            newVal = 10
         case "card_b_sq.png":
            newVal = 10
         case "card_b_sk.png":
            newVal = 10
         case "card_b_sa.png":
            newVal = 1
             
         default:
             print("Out of scope")
         }
         
         return newVal
     }


}
