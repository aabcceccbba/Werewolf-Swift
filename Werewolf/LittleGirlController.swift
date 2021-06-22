//
//  LittleGirlController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/25/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class LittleGirlController: UIViewController {

    @IBOutlet weak var littleGirlTF: UITextField!
    @IBOutlet weak var littleGirlLabel1: UILabel!
    @IBOutlet weak var littleGirlLabel2: UILabel!
    
    var checkObject = Check()
    
    override func viewDidLoad() {
        RolesController.littleGirlDetected = false
        
        if RolesController.nextNight == true {
            littleGirlLabel1.isHidden = true
            littleGirlLabel2.isHidden = true
            littleGirlTF.isHidden = true
        }
        
        if RolesController.special["Little Girl"] != nil {
            littleGirlTF.text = String(RolesController.special["Little Girl"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
        if littleGirlTF.text != "" {
            let littleGirl = Int(littleGirlTF.text!)!
            
            // ID out of range
            if littleGirl > PlayerNumberController.num || littleGirl < 1 {
                checkObject.alert(controller: self, role: "Little Girl", id: littleGirl, type: "out of range")
                return false
            }
            
            // if the ID is conflicted to other roles
            if RolesController.map[littleGirl] != nil && RolesController.map[littleGirl] != "Little Girl" {
                checkObject.alert(controller: self, role: "Little Girl", id: littleGirl, type: "conflict roles")
                return false
            }
            
            // if Little Girl ID is nil or changed
            checkObject.updateSpecial(role: "Little Girl", id: littleGirl)
//            if RolesController.special["Little Girl"] == nil {
//                RolesController.special["Little Girl"] = littleGirl
//                RolesController.map[littleGirl] = "Little Girl"
//            }
//            else if RolesController.special["LittleGirl"] != littleGirl {
//                RolesController.map.removeValue(forKey: RolesController.special["Little Girl"]!)
//                RolesController.special["Little Girl"] = littleGirl
//                RolesController.map[littleGirl] = "Little Girl"
//            }
        }
        
        else {
            if RolesController.special["Little Girl"] != nil {
                RolesController.map.removeValue(forKey: RolesController.special["Little Girl"]!)
                RolesController.special["Little Girl"] = nil
                RolesController.littleGirlDetected = false
            }
        }
        
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier != "toRoles" {
            return check()
        }
        return true
//        if check() || identifier == "toRoles" {
//            return true
//        }
//        return false
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
