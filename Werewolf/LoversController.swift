//
//  LoversController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/29/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class LoversController: UIViewController {
    
    @IBOutlet weak var lover1TF: UITextField!
    @IBOutlet weak var lover2TF: UITextField!
    @IBOutlet weak var loversLabel: UILabel!
    @IBOutlet weak var lover1Label: UILabel!
    @IBOutlet weak var lover2Label: UILabel!
    
    override func viewDidLoad() {
        if RolesController.nextNight == true {
            loversLabel.isHidden = true
            lover1Label.isHidden = true
            lover2Label.isHidden = true
            lover1TF.isHidden = true
            lover2TF.isHidden = true
        }
        
        if RolesController.lover1 != -1 && RolesController.lover2 != -1 {
            lover1TF.text = String(RolesController.lover1)
            lover2TF.text = String(RolesController.lover2)
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func check() -> Bool {
        
        // later will add the condition whether lovers are dead
        if CupidoController.cupido != -1 {
            if lover1TF.text == "" || lover2TF.text == "" {
                let alert = UIAlertController(title: "Please enter both Lovers Number", message: "The lovers number has been assigned by Cupido", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            else {
                let lover1ID = Int(lover1TF.text!)!
                let lover2ID = Int(lover2TF.text!)!
                
                // loverID out of range
                if lover1ID < 1 || lover1ID > PlayerNumberController.num || lover2ID < 1 || lover2ID > PlayerNumberController.num {
                    
                    let alert = UIAlertController(title: "The Lover ID is out of range", message: "The Lover number could be only between 1 to " + String(PlayerNumberController.num) + ".", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                    return false
                }
                
                // loverID duplicate
                if lover1ID == lover2ID {
                    let alert = UIAlertController(title: "The Lover IDs are duplicate", message: "The Lovers have to be 2 distinct players.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                    return false
                }
                
                if RolesController.lover1 == -1 || RolesController.lover1 != lover1ID {
                    RolesController.lover1 = lover1ID
                }
                
                if RolesController.lover2 == -1 || RolesController.lover2 != lover2ID {
                    RolesController.lover2 = lover2ID
                }
                
                RolesController.third.insert(lover1ID)
                RolesController.third.insert(lover2ID)
                
            }
        }
        
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "toRoles" {
            return true
        }
        
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
