//
//  HunterController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/25/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class HunterController: UIViewController {
    
    @IBOutlet weak var hunterTF: UITextField!
    
    override func viewDidLoad() {
        if RolesController.special["Hunter"] != nil {
            hunterTF.text = String(RolesController.special["Hunter"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
        if hunterTF.text != "" {
            let hunter = Int(hunterTF.text!)!
            
            // out of range
            if hunter > PlayerNumberController.num || hunter < 1 {
                let alert = UIAlertController(title: "Please enter the right Hunter ID", message: "Hunter ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
            
            // if the ID is conflicted to other roles
            if RolesController.map[hunter] != nil && RolesController.map[hunter] != "Hunter" {
                let alert = UIAlertController(title: "The Hunter ID is conflicted with another role", message: "This ID number has already been assigned to " + String(RolesController.map[hunter]!) + ".", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
            
            // if Hunter ID is nil or changed
            if RolesController.special["Hunter"] == nil {
                RolesController.special["Hunter"] = hunter
                RolesController.map[hunter] = "Hunter"
            }
            else if RolesController.special["Hunter"] != hunter {
                RolesController.map.removeValue(forKey: RolesController.special["Hunter"]!)
                RolesController.special["Hunter"] = hunter
                RolesController.map[hunter] = "Hunter"
            }
        }
        
        // if the old ID has been removed
        else {
            if RolesController.special["Hunter"] != nil {
                RolesController.map.removeValue(forKey: RolesController.special["Hunter"]!)
                RolesController.special["Hunter"] = nil
            }
        }
        
        return true
    }
    
    // input number validation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return check()
//        if hunterTF.text != "" {
//            let hunter = Int(hunterTF.text!)!
//            if hunter > PlayerNumberController.num || hunter < 1 {
//                let alert = UIAlertController(title: "Please enter the right Hunter ID", message: "Hunter ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//                self.present(alert, animated: true)
//                return false
//            }
//        }
//        return true
    }
    
    // used to implement back bar button
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParentViewController {
            if check(){
            }
        }

    }
    
    // touch screen to remove keyboard
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
