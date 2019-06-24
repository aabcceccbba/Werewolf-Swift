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
    
    override func viewDidLoad() {
        if RolesController.special["Little Girl"] != nil {
            littleGirlTF.text = String(RolesController.special["Little Girl"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if littleGirlTF.text != "" {
            let littleGirl = Int(littleGirlTF.text!)!
            
            // ID out of range
            if littleGirl > PlayerNumberController.num || littleGirl < 1 {
                let alert = UIAlertController(title: "Please enter the right Little Girl ID", message: "Little Girl ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            
            // if Little Girl ID is nil
            if RolesController.special["Little Girl"] == nil || RolesController.special["LittleGirl"] != littleGirl {
                RolesController.special["Little Girl"] = littleGirl
            }
        }
        
        else {
            RolesController.special["Little Girl"] = nil
        }
        
//        if identifier == "toRoles" {
//            return true
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
