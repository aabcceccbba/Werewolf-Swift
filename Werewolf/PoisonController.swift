//
//  PoisonController.swift
//  Werewolf
//
//  Created by Kay Lu on 3/25/20.
//  Copyright © 2020 a. All rights reserved.
//

import UIKit

class PoisonController: UIViewController {

    @IBOutlet weak var poisonPlayer: UITextField!
    
    override func viewDidLoad() {
        
        if RolesController.potentialPoison != -1 {
            poisonPlayer.text = String(RolesController.potentialPoison)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
        if poisonPlayer.text != "" {
            let poison = Int(poisonPlayer.text!)!
            // out of range
            if poison > PlayerNumberController.num || poison < 1 {
                // out of range
                let alert = UIAlertController(title: "Please enter the correct poison target ID", message: "The Player ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    return false
            }
            
            // if the input is dead
            if !RolesController.alive.contains(poison) {
                let alert = UIAlertController(title: "Please enter the correct poison target ID", message: "This Player is already dead", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            // if the poisoned ID is -1 or changed
            RolesController.potentialPoison = poison
            if RolesController.poison == 1 {
                RolesController.poison = 0
            }
        }
        // empty
        else {
            // need to update the potentialPoison
            RolesController.potentialPoison = -1
            if RolesController.poison == 0 {
                RolesController.poison = 1
            }
            
        }
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return check()
    }
    
    // hide the keyboard when touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
