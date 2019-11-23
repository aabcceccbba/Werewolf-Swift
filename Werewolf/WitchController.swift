//
//  WitchController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/6/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class WitchController: UIViewController {

    @IBOutlet weak var witchTF: UITextField!
    
    override func viewDidLoad() {
        if RolesController.special["Witch"] != nil {
            witchTF.text = String(RolesController.special["Witch"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
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
            if RolesController.special["Witch"] != nil {
                RolesController.map.removeValue(forKey:RolesController.special["Witch"]!)
                    RolesController.special["Witch"] = nil
            }
        }
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return check()
    }
    
    // used to implement back bar button
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParentViewController {
            if check(){
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
