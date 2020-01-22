//
//  DayController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/27/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class DayController: UIViewController {

    @IBOutlet weak var deathNote: UILabel!
    
    override func viewDidLoad() {
        if RolesController.potentialVictim != -1 {
            deathNote.text = "Player #" + String(RolesController.potentialVictim) + " died tonight"
            
            // if the player is hunter
            
            // if the player is one of the lovers
            RolesController.alive.remove(RolesController.potentialVictim)
        }
        else {
            deathNote.text = "No one died tonight"
        }
        
        super.viewDidLoad()

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
