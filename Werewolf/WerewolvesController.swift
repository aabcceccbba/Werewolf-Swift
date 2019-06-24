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
    
    var wolf1 = -1
    var wolf2 = -1
    var wolf3 = -1
    var wolf4 = -1
    var wolf5 = -1
    var wolf6 = -1
    var total = 0
    
    var set : Set<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // empty input
        if wolf1TF.text == "" && wolf2TF.text == "" && wolf3TF.text == "" && wolf4TF.text == "" && wolf5TF.text == "" && wolf6TF.text == "" {
            RolesController.group["Werewolf"] = nil
            let alert = UIAlertController(title: "Please enter Werewolf numbers", message: "You need at least one Werewolf", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        total = 0
        if wolf1TF.text != "" {
            wolf1 = Int(wolf1TF.text!)!
            total += 1
            set.insert(wolf1)
        }
        if wolf2TF.text != "" {
            wolf2 = Int(wolf2TF.text!)!
            total += 1
            set.insert(wolf2)
        }
        if wolf3TF.text != "" {
            wolf3 = Int(wolf3TF.text!)!
            total += 1
            set.insert(wolf3)
        }
        if wolf4TF.text != "" {
            wolf4 = Int(wolf4TF.text!)!
            total += 1
            set.insert(wolf4)
        }
        if wolf5TF.text != "" {
            wolf5 = Int(wolf5TF.text!)!
            total += 1
            set.insert(wolf5)
        }
        if wolf6TF.text != "" {
            wolf6 = Int(wolf6TF.text!)!
            total += 1
            set.insert(wolf6)
        }
        print(set.count)
        print(total)
        
        // overlap alert
        if set.count < total {
            let alert = UIAlertController(title: "Please enter different Werewolf numbers", message: "Werewolf numbers cannot be overlap", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
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
        
        // there is no problem of the input
        // update Wolf ID
        if RolesController.group["Werewolf"] == nil || RolesController.group["Werewolf"] != set {
            RolesController.group["Werewolf"] = set
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
