//
//  GameSceondControler.swift
//  betterCardGame
//
//  Created by Patryk Soliński on 13/07/2019.
//  Copyright © 2019 Patryk Soliński. All rights reserved.
//

import UIKit

class GameSceondControler: UIViewController {
    
    var playerPtsLast = ""
    var CPUPtsLast = ""
    var TiesPtsLast = ""
    var zeroTies = 0
    var PlayerNameLast = ""

    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var tiesScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var tieScore = 0
    
    @IBAction func dealTapped(_ sender: UIButton) {
        func resetStats() {
            leftScore = 0
            leftScoreLabel.text = String(leftScore)
            rightScore = 0
            rightScoreLabel.text = String(rightScore)
            tieScore = 0
            tiesScoreLabel.text = String(tieScore)
        }
        
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            leftScore += 1
            // player wins
            leftScoreLabel.text = String(leftScore)
            
        } else if leftNumber < rightNumber {
            rightScore += 1
            // CPU wins
            rightScoreLabel.text = String(rightScore)
            
        } else if leftNumber == rightNumber {
            tieScore += 1
            // tie
            tiesScoreLabel.text = String(tieScore)
        }
        
        if leftScore >= Int(CPUPtsLast)! {
            winLoseLabel.text = "CPU take \(CPUPtsLast) points and WINS!"
            resetStats()
            print("CPU wins")
        } else if rightScore >= Int(playerPtsLast)! {
            if PlayerNameLast.isEmpty {
                winLoseLabel.text = "Player take \(playerPtsLast) points and WINS!"
            } else {
                winLoseLabel.text = "\(PlayerNameLast) take \(playerPtsLast) points and WINS!"
            }
            resetStats()
            print("player wins")
        }
        if TiesPtsLast.isEmpty {
        } else if tieScore == Int(TiesPtsLast)! {
            winLoseLabel.text = "\(TiesPtsLast) tie's points reset game..."
            resetStats()
            print("tie's resets")
        }
        print("L: \(leftScore)")
        print("R: \(rightScore)")
        print("T: \(tieScore)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
