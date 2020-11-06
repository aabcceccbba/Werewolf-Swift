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
    @IBOutlet weak var victimTF: UITextField!
    
    @IBOutlet weak var wolfLabel1: UILabel!
    @IBOutlet weak var wolfLabel2: UILabel!
    @IBOutlet weak var wolfLabel3: UILabel!
    @IBOutlet weak var victimLabel: UILabel!
    
    var wolf1 = -1
    var wolf2 = -1
    var wolf3 = -1
    var wolf4 = -1
    var wolf5 = -1
    var wolf6 = -1
    var total = 0
    var victim = -1
    
    var set : Set<Int> = []
    
    override func viewDidLoad() {
        if RolesController.littleGirlDetected == true {
            victimLabel.isHidden = true
            victimTF.isHidden = true
        }
        
        if RolesController.nextNight == true {
            wolfLabel1.isHidden = true
            wolfLabel2.isHidden = true
            wolfLabel3.isHidden = true
            wolf1TF.isHidden = true
            wolf2TF.isHidden = true
            wolf3TF.isHidden = true
            wolf4TF.isHidden = true
            wolf5TF.isHidden = true
            wolf6TF.isHidden = true
        }
        
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
    
    // when the Little Girl is detected by werewolves
    @IBAction func littleGirlDetected(_ sender: Any) {
        // no little girl in the game
        if RolesController.special["Little Girl"] == nil {
            let alert = UIAlertController(title: "There is no Little Girl specified in this game", message: "You can go back to the Little Girl page to specify (only possible if this is the first night)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        // little girl exists
        else{
            let alert = UIAlertController(title: "Is the Little Girl detected by the Werewolves?", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                RolesController.littleGirlDetected = true
                self.victimLabel.isHidden = true
                self.victimTF.isHidden = true
                RolesController.potentialVictim = -1
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
                RolesController.littleGirlDetected = false
            }))
            
            self.present(alert, animated: true)
        }
    }
    
    func check(withIdentifier identifier: String) -> Bool {
        // reset wolves IDs
//        RolesController.wolves = Set<Int>()
//        wolf = [-1, -1, -1, -1, -1, -1]
        var wolf = Set<Int>()
        total = 0
        
        // empty input
        if wolf1TF.text == "" && wolf2TF.text == "" && wolf3TF.text == "" && wolf4TF.text == "" && wolf5TF.text == "" && wolf6TF.text == "" {
            
            // empty map and wolves
            for wid in RolesController.wolves {
                RolesController.map.removeValue(forKey: wid)
            }
            RolesController.wolves = Set<Int>()

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

        // duplicate alert
        let duplicateAlert = UIAlertController(title: "The Wolves IDs are duplicate", message: "Wolves IDs need to be unique", preferredStyle: .alert)
        
        duplicateAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        duplicateAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if wolf1TF.text != "" {
            wolf1 = Int(wolf1TF.text!)!
            wolf.insert(wolf1)
            total += 1
//            set.insert(wolf1)
            print("text 1 is " + wolf1TF.text!)
            
        }
        if wolf2TF.text != "" {
            wolf2 = Int(wolf2TF.text!)!
            wolf.insert(wolf2)
            total += 1
//            set.insert(wolf2)
            print("text 2 is " + wolf2TF.text!)
        }
        if wolf3TF.text != "" {
            wolf3 = Int(wolf3TF.text!)!
            wolf.insert(wolf3)
            total += 1
            print("text 3 is " + wolf3TF.text!)
        }
        if wolf4TF.text != "" {
            wolf4 = Int(wolf4TF.text!)!
            wolf.insert(wolf4)
            total += 1
            print("text 4 is " + wolf4TF.text!)
            
        }
        if wolf5TF.text != "" {
            wolf5 = Int(wolf5TF.text!)!
            wolf.insert(wolf5)
            total += 1
            print("text 5 is " + wolf5TF.text!)
        }
        if wolf6TF.text != "" {
            wolf6 = Int(wolf6TF.text!)!
            wolf.insert(wolf6)
            total += 1
            print("text 6 is " + wolf6TF.text!)
        }
        
        // little girl is detected -> little girl will be the victim
        if RolesController.littleGirlDetected == true {
            victimTF.text = ""
        }
        
        if victimTF.text != "" {
            victim = Int(victimTF.text!)!
        }
        
        print(total)
        print(wolf.count)
        for item in wolf {
            print(String(item) + " ")
        }
        // id duplicate within wolves
        if total > wolf.count {
            self.present(duplicateAlert, animated: true)
            return false
        }
        
        // out of range
        if wolf1 > PlayerNumberController.num || wolf2 > PlayerNumberController.num || wolf3 > PlayerNumberController.num || wolf4 > PlayerNumberController.num || wolf5 > PlayerNumberController.num || wolf6 > PlayerNumberController.num || wolf1 * wolf2 * wolf3 * wolf4 * wolf5 * wolf6 == 0 {
            
            let alert = UIAlertController(title: "Please enter the right Werewolf numbers", message: "Werewolf ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return false
        }
        
        // out of range for victim
        if victim != -1 && (victim > PlayerNumberController.num || victim == 0) {
            
            let alert = UIAlertController(title: "Please enter the right Victim numbers", message: "Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        // dead victim
        if victim != -1 && !RolesController.alive.contains(victim) {
            let alert = UIAlertController(title: "Please enter the right Victim numbers", message: "Player ID" + String(victim) + " has been already dead", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        // conflict check
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
        for wid in RolesController.wolves {
            RolesController.map.removeValue(forKey: wid);
        }
        RolesController.wolves = Set<Int>()
        
        for item in wolf {
            if item != -1 {
                RolesController.wolves.insert(item)
                RolesController.map[item] = "Wolf"
            }
        }
        
        if victim != -1 { RolesController.potentialVictim = victim
        }
        
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return check(withIdentifier: identifier)
    }
    
    // used to implement back bar button
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
