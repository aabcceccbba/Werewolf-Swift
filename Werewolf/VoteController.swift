//
//  VoteController.swift
//  Werewolf
//
//  Created by Kay Lu on 11/18/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class VoteController: UIViewController {

    @IBOutlet weak var eliminateTF: UITextField!
    @IBOutlet weak var loverEliminateLabel: UILabel!
    
    override func viewDidLoad() {
        // hide the back button to prevent going back
        navigationItem.hidesBackButton = true
        loverEliminateLabel.isHidden = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if identifier == "toRoles" {
            return true
        }
        
        // empty input
        if eliminateTF.text == "" {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "Retaliated Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            return false
        }
        
        let eliminate = Int(eliminateTF.text!)!
        // out of range
        if eliminate > PlayerNumberController.num || eliminate < 1 {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "Retaliated Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            return false
        }
        
        // already dead
        if !RolesController.alive.contains(eliminate) {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "This player is already dead.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        
        // alert before go to the next controller
        let finalAlert = UIAlertController(title: "Please confirm all the inputs are correct", message: "You are not able to modify after going Next.", preferredStyle: .alert)
        
        finalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // update data before go to the next controller
            // remove victim and update alive
            RolesController.alive.remove(eliminate)
            
            // lover update...
            if eliminate == RolesController.lover1 && RolesController.alive.contains(RolesController.lover2) {
                RolesController.alive.remove(RolesController.lover2)
                self.loverEliminateLabel.text = "This victim's lover " + String(RolesController.lover2) + " is also eliminated"
            }
            
            if eliminate == RolesController.lover2 && RolesController.alive.contains(RolesController.lover1) {
                RolesController.alive.remove(RolesController.lover1)
                self.loverEliminateLabel.text = "This victim's lover " + String(RolesController.lover1) + " is also eliminated"
            }
            self.performSegue(withIdentifier: "nextNight", sender: nil)

        }))
        finalAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(finalAlert, animated: true)
        return true
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
