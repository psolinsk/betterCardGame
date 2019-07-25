//
//  NameViewController.swift
//  betterCardGame
//
//  Created by Patryk Soliński on 14/07/2019.
//  Copyright © 2019 Patryk Soliński. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField! //Player name label
    @IBOutlet weak var doneBtn: UIButton! // done button
    
    //Done Btn click; send nameLabel to "Game Settings VC"
    var nameText = ""
    @IBAction func doneBtnClick(_ sender: Any) {
        self.nameText = nameLabel.text!
        performSegue(withIdentifier: "afterName", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameController
        vc.finalName = self.nameText
    }

}
