//
//  ViewController.swift
//  betterCardGame
//
//  Created by Patryk Soliński on 13/07/2019.
//  Copyright © 2019 Patryk Soliński. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var warButton: UIButton! // War Button

// PLAYER:
    @IBOutlet weak var showPlayerName: UILabel! // "Player Hi" Label
    @IBOutlet weak var playerStepper: UIStepper! // Player Points stepper
    @IBOutlet weak var playerPtsLabel: UILabel! // Player points Label
    @IBAction func playerStepper(_ sender: UIStepper) {
        playerPtsLabel.text = Int(sender.value).description
    } // Player stepper +/- adding in "Player points Label"
    
// CPU:
    @IBOutlet weak var CPUPtsLabel: UILabel! // CPU points label
    @IBOutlet weak var CPUSlider: UISlider! // CPU points slider
    @IBAction func CPUSliderPts(_ sender: UISlider) {
        CPUPtsLabel.text = "\(Int(CPUSlider.value))"
    } // CPU points +/- adding in " CPU points Label"
    
// TIES:
    @IBOutlet weak var tiesSwitchBtn: UISwitch! // Switch button - ties: on/off
    @IBOutlet weak var tiesTextLbl: UITextField! // Points to ties text field - switch_off: defaults hidden
    @IBOutlet weak var tiesLabelTextInfo: UILabel! // Points to ties label - switch_off: defaults hidden
    
    // seting TIES switch button - on/off
    @IBAction func tiesSwitchFunc(_ sender: Any) {
        if tiesSwitchBtn.isOn { // ON
            tiesTextLbl.text = "5" // "ties points text filed" defaults equal
            tiesTextLbl.isHidden = false // unhide "ties points label"
            tiesLabelTextInfo.isHidden = false // unhide "ties label info"
            tiesSwitchBtn.setOn(true, animated:true)
        } else { // OFF
            tiesLabelTextInfo.isHidden = true // hide
            tiesTextLbl.isHidden = true // hide (up)
            tiesSwitchBtn.setOn(false, animated:true)
        }
    }
    
    var finalName = "" // variable to passing "playerName" from "Name VC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if finalName == "" { // Secure before unknown players :)
            showPlayerName.text = "Hi unknown Player 😇"
        } else { // Welcome information if player enter his nickname
            showPlayerName.text = "Hi \(finalName) 😊"
        }
        
        // Player Stepper settings
        playerStepper.wraps = false
        playerStepper.autorepeat = false
        playerStepper.maximumValue = 50
        playerStepper.minimumValue = 1
        
        // CPUSlider settings
        CPUSlider.maximumValue = 50
        CPUSlider.minimumValue = 1
    }
    // passing Points to "Game Second VC"
    var playerPointsFinal = ""
    var CPUPointsFinal = ""
    var tiesPointsFinal = ""
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameSceondControler
        vc.playerPtsLast = self.playerPointsFinal
        vc.CPUPtsLast = self.CPUPointsFinal
        vc.TiesPtsLast = self.tiesPointsFinal
        vc.PlayerNameLast = self.finalName
    }
    
    @IBAction func warBtnClick(_ sender: UIButton) {
        self.playerPointsFinal = playerPtsLabel.text! // Player Points pass
        self.CPUPointsFinal = CPUPtsLabel.text! // CPU points pass
        self.tiesPointsFinal = tiesTextLbl.text! // Ties points pass
        performSegue(withIdentifier: "afterSetings", sender: self)
        
    }
    
    
}
