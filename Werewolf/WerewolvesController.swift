//
//  WerewolvesController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/6/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class WerewolvesController: UIViewController {
    
    @IBOutlet weak var wolf1TF: UITextField!
    @IBOutlet weak var wolf2TF: UITextField!
    @IBOutlet weak var wolf3TF: UITextField!
    @IBOutlet weak var wolf4TF: UITextField!
    @IBOutlet weak var wolf5TF: UITextField!
    @IBOutlet weak var wolf6TF: UITextField!
    
//    var wolfTf = [UITextField]()
    var wolf1 = -1
    var wolf2 = -1
    var wolf3 = -1
    var wolf4 = -1
    var wolf5 = -1
    var wolf6 = -1
    var total = 0
//    var wolf = [-1, -1, -1, -1, -1, -1]
    
    var set : Set<Int> = []
    
    override func viewDidLoad() {
        let wolfTF = [wolf1TF, wolf2TF, wolf3TF, wolf4TF, wolf5TF, wolf6TF]

        // show current Wolf IDs
        var index = 0
        for wid in RolesController.wolves {
            wolfTF[index]!.text = String(wid)
            index += 1
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // reset wolves IDs
        RolesController.wolves = Set<Int>()
//        wolf = [-1, -1, -1, -1, -1, -1]
        var wolf = Set<Int>()
        total = 0
        
        // empty input
        if wolf1TF.text == "" && wolf2TF.text == "" && wolf3TF.text == "" && wolf4TF.text == "" && wolf5TF.text == "" && wolf6TF.text == "" {
            
            // if go to Roles -> return true
            if identifier == "toRoles" {
                return true
            }
            
            let alert = UIAlertController(title: "Please enter Werewolf numbers", message: "You need at least one Werewolf", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        

        // conflict alert
        let conflictAlert = UIAlertController(title: "The Wolves IDs are duplicate", message: "Wolves IDs need to be unique", preferredStyle: .alert)
        
        conflictAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        conflictAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if wolf1TF.text != "" {
            wolf1 = Int(wolf1TF.text!)!
            wolf.insert(wolf1)
            total += 1
//            set.insert(wolf1)
            
        }
        if wolf2TF.text != "" {
            wolf2 = Int(wolf2TF.text!)!
            wolf.insert(wolf2)
            total += 1
//            set.insert(wolf2)
        }
        if wolf3TF.text != "" {
            wolf3 = Int(wolf3TF.text!)!
            wolf.insert(wolf3)
            total += 1
//            set.insert(wolf3)
        }
        if wolf4TF.text != "" {
            wolf4 = Int(wolf4TF.text!)!
            wolf.insert(wolf4)
            total += 1
//            set.insert(wolf4)
        }
        if wolf5TF.text != "" {
            wolf5 = Int(wolf5TF.text!)!
            wolf.insert(wolf5)
            total += 1
//            set.insert(wolf5)
        }
        if wolf6TF.text != "" {
            wolf6 = Int(wolf6TF.text!)!
            wolf.insert(wolf6)
            total += 1
        }
        
        // id duplicate within wolves
        if total > wolf.capacity {
            self.present(conflictAlert, animated: true)
            return false
        }
        
        // wrong range
        if wolf1 > PlayerNumberController.num || wolf2 > PlayerNumberController.num || wolf3 > PlayerNumberController.num || wolf4 > PlayerNumberController.num || wolf5 > PlayerNumberController.num || wolf6 > PlayerNumberController.num || wolf1 * wolf2 * wolf3 * wolf4 * wolf5 * wolf6 == 0 {
            
            let alert = UIAlertController(title: "Please enter the right Werewolf numbers", message: "Werewolf ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return false
        }

        // duplicate check
        for item in wolf {
            if item != -1 {
                // if conflict with other roles
                if RolesController.map[item] != nil && RolesController.map[item] != "Wolf" {
                    let conflictAlert = UIAlertController(title: "The Wolf IDs are conflicted with another role", message: "The ID " + String(item) + " has already been assigned to " + String(RolesController.map[item]!) + ".", preferredStyle: .alert)
                    
                    conflictAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    conflictAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(conflictAlert, animated: true)
                    return false
                }
            }
        }
        
        // passed all checks
        for item in wolf {
            if item != -1 {
                RolesController.wolves.insert(item)
                RolesController.map[item] = "Wolf"
            }
        }
        
        
        // there is no problem of the input
        // update Wolf ID
//        if RolesController.group["Werewolf"] == nil || RolesController.group["Werewolf"] != set {
//            RolesController.group["Werewolf"] = set
//        }
        
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
