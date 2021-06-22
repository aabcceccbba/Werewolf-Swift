//
//  Check.swift
//  Werewolf
//
//  Created by Kay Lu on 6/20/21.
//  Copyright © 2021 a. All rights reserved.
//

import UIKit

class Check: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // create and present an alert
    func alert(controller: UIViewController, role: String, id: Int, type: String) {
        var title = "Error";
        var message = "";
        
        // out of the player number range
        if type == "out of range" {
            title = "The input ID is " + type
            message = "The " + role + " number could be only between 1 to " + String(PlayerNumberController.num) + "."
        }
        // the same id has already been assigned to another role
        else if type == "conflict roles" {
            title = "The input ID is conflicted with another role"
            message = "This ID number has already been assigned to " + String(RolesController.map[id]!) + "."
        }
        // Cupido in on -> both lovers are required
        else if type == "both lovers" {
            title = "Please enter both Lovers Number"
            message = "The lovers numbers need to be assigned by Cupido."
        }
        
        // Lover IDs can't duplicate
        else if type == "duplicate lovers" {
            title = "The Lover IDs are duplicate"
            message = "The Lovers have to be 2 distinct players."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true)
    }
    
    // pre-update the special role and its info
    func updateSpecial(role: String, id: Int) {
        if RolesController.special[role] == nil{
            RolesController.special[role] = id
            RolesController.map[id] = role
        }
        else if RolesController.special[role] != id {
            RolesController.map.removeValue(forKey:  RolesController.special[role]!)
            RolesController.special[role] = id
            RolesController.map[id] = role
        }
    }
    
    // pre-clear the special role and its info if needed
    func clearSpecial(role: String) {
        if RolesController.special[role] != nil {
            RolesController.map.removeValue(forKey: RolesController.special[role]!)
            RolesController.special[role] = nil
        }
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
