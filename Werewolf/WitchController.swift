//
//  WitchController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/6/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class WitchController: UIViewController {

    @IBOutlet weak var witchLabel: UILabel!
    @IBOutlet weak var witchTF: UITextField!
    @IBOutlet weak var potionLabel: UILabel!
    
    override func viewDidLoad() {
        if RolesController.nextNight == true {
            witchLabel.isHidden = true
            witchTF.isHidden = true
        }
        
        if RolesController.special["Witch"] != nil {
            witchTF.text = String(RolesController.special["Witch"]!)
        }
        
        updatePotion()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func healing(_ sender: Any) {
        print("potential victim: ")
        if(RolesController.potentialVictim != -1 && RolesController.healing == 1 && witchTF.text != ""){
            let alert = UIAlertController(title: "Are you sure to use Healing Potion?", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                RolesController.healing = 0
                self.updatePotion()
                RolesController.potentialVictim = -1
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
//    @IBAction func poison(_ sender: Any) {
//        if(poison == 1){
//            let alert = UIAlertController(title: "Are you sure to use Poison Potion?", message: "", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
//                self.poison = 0
//                self.updatePotion()
//            }))
//            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//            self.present(alert, animated: true)
//        }
//    }
    
    func updatePotion() {
        potionLabel.text = "Healing Potion: " + String(RolesController.healing) + "\nPoison Potion: " + String(RolesController.poison)
    }
    
    func check(withIdentifier identifier: String) -> Bool {
        if witchTF.text != "" {
        
            let witch = Int(witchTF.text!)!
            // out of range
            if witch > PlayerNumberController.num || witch < 1 {
                let alert = UIAlertController(title: "Please enter the right Witch ID", message: "Witch ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            
            // if the ID is conflicted to other roles
            if RolesController.map[witch] != nil && RolesController.map[witch] != "Witch" {
                let alert = UIAlertController(title: "The Witch ID is conflicted with another role", message: "This ID number has already been assigned to " + String(RolesController.map[witch]!) + ".", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
            
            // if Witch ID is nil or changed
            if RolesController.special["Witch"] == nil {
                RolesController.special["Witch"] = witch
                RolesController.map[witch] = "Witch"
            }
            else if RolesController.special["Witch"] != witch {
                RolesController.map.removeValue(forKey: RolesController.special["Witch"]!)
                RolesController.special["Witch"] = witch
                RolesController.map[witch] = "Witch"
            }
        }
        
        // empty
        else {
            // when clicking Use Poison Potion
            if identifier == "usePoisonPotion" && RolesController.special["Witch"] == nil {
                let alert = UIAlertController(title: "The Witch number can't be empty", message: "To use Poison Potion, you must have a Witch", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            
            // can't be empty if used potions
            if RolesController.healing * RolesController.poison == 0 {
                let alert = UIAlertController(title: "The Witch number can't be empty", message: "You have used potion(s), which indicates a Witch is required. The previous Witch ID is automatically restored", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.witchTF.text = String(RolesController.special["Witch"]!)
                }))
                
                self.present(alert, animated: true)
                return false
            }
            
            // no potions is used -> update the Witch number
            if RolesController.special["Witch"] != nil {
                RolesController.map.removeValue(forKey:RolesController.special["Witch"]!)
                    RolesController.special["Witch"] = nil
            }
        }
        
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return check(withIdentifier: identifier)
    }
    
    // used to implement back bar button update
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParentViewController {
            if check(withIdentifier: ""){
            }
        }

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
