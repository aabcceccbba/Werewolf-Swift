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
    @IBOutlet weak var HunterDeathNote: UILabel!
    @IBOutlet weak var LoverDeathNote: UILabel!
    @IBOutlet weak var retaliateTF: UITextField!
    var lover = -1
    var died = Set<Int>()
    
    override func viewDidLoad() {
        retaliateTF.isHidden = true

        if(RolesController.potentialVictim != -1){
            died.insert(RolesController.potentialVictim)
        }
        
        if(RolesController.potentialPoison != -1){
            died.insert(RolesController.potentialPoison)
        }
        
        if died.count > 0 {
            var victims = ""
            for i in died {
                victims = victims + String(i) + " "
            }
            
            deathNote.text = "Player #" + victims + " died tonight"
            
            
            // if the player is hunter
            if RolesController.special["Hunter"] != nil && died.contains(RolesController.special["Hunter"]!) {
                HunterDeathNote.text = "The Hunter is dying. S/he can choose to retaliate to:"
                retaliateTF.isHidden = false
            }
            
            // if the player is lover
            if died.contains(RolesController.lover1) || died.contains(RolesController.lover2) {
                
                if died.contains(RolesController.lover1) && !died.contains(RolesController.lover2) {
                    lover = RolesController.lover2
                }
                
                if died.contains(RolesController.lover2) && !died.contains(RolesController.lover1){
                    lover = RolesController.lover1
                }
                
                if(lover != -1) {
                    LoverDeathNote.text = "The victim is one the lovers. Player #" + String(lover) + " also dies."
                }
//                RolesController.alive.remove(lover)
            }
//        RolesController.alive.remove(RolesController.potentialVictim)
        }
    
        else {
            deathNote.text = "No one died tonight"
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // if the TF is not hidden
        if retaliateTF.isHidden == false {
            // Hunter has retaliated
            if retaliateTF.text != ""{
                let retaliateVictim = Int(retaliateTF.text!)!
                
                // out of range
                if retaliateVictim > PlayerNumberController.num || retaliateVictim < 1 {
                    let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "Retaliated Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    return false
                }
                                
                // if already dead
                if !RolesController.alive.contains(retaliateVictim) {
                    let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "This player is already dead.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    return false
                }
            }
        }
        
        let finalAlert = UIAlertController(title: "Please confrim all the inputs are correct", message: "You are not able to modify after going Next.", preferredStyle: .alert)
        
        finalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler:
            { action in
                // update data before go to the next controller
                for victim in self.died { RolesController.alive.remove(victim)
                }
                if self.lover != -1 {
                    RolesController.alive.remove(self.lover)
                }
                self.performSegue(withIdentifier: "vote", sender: nil)
        }))
        finalAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(finalAlert, animated: true)
        
        // update alive
        

        return true
    }
    
    // hide the keyboard when touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
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
