//
//  FortuneTellerController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/6/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class FortuneTellerController: UIViewController {

    @IBOutlet weak var fortuneTellerTF: UITextField!
    
    
    
    override func viewDidLoad() {
        
        if RolesController.special["Fortune Teller"] != nil {
            fortuneTellerTF.text = String(RolesController.special["Fortune Teller"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // empty input
        if fortuneTellerTF.text == "" {
            
            // if go to Roles -> return true
            if identifier == "toRoles" {
                return true
            }
            
            RolesController.special["Fortune Teller"] = nil
            let alert = UIAlertController(title: "Please enter a Fortune Teller number", message: "You need at least one Fortune Teller", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        let fortuneTeller = Int(fortuneTellerTF.text!)!
        
        // out of range
        if fortuneTeller > PlayerNumberController.num || fortuneTeller < 1 {
            
            let alert = UIAlertController(title: "Please enter the right Fortune Teller ID", message: "Fortune Teller ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        // if the ID is conflicted to other roles
        if RolesController.map[fortuneTeller] != nil && RolesController.map[fortuneTeller] != "Fortune Teller" {
            let alert = UIAlertController(title: "The Fortune Teller ID is conflicted with another role", message: "This ID number has already been assigned to " + String(RolesController.map[fortuneTeller]!) + ".", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        
        // if Fortune Teller ID is nil or changed
        if RolesController.special["Fortune Teller"] == nil {
            RolesController.special["Fortune Teller"] = fortuneTeller
            RolesController.map[fortuneTeller] = "Fortune Teller"
        }
        else if RolesController.special["Fortune Teller"] != fortuneTeller {
            RolesController.map.removeValue(forKey: RolesController.special["Fortune Teller"]!)
            RolesController.special["Fortune Teller"] = fortuneTeller
            RolesController.map[fortuneTeller] = "Fortune Teller"
        }
        
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
