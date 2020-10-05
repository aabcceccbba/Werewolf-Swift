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
    @IBOutlet weak var fortuneTellerLabel1: UILabel!
    @IBOutlet weak var fortuneTellerLabel2: UILabel!
    
    override func viewDidLoad() {
        
        if RolesController.nextNight == true {
            fortuneTellerLabel1.isHidden = true
            fortuneTellerLabel2.isHidden = true
            fortuneTellerTF.isHidden = true
        }
        
        if RolesController.special["Fortune Teller"] != nil {
            fortuneTellerTF.text = String(RolesController.special["Fortune Teller"]!)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
        
        if fortuneTellerTF.text != "" {
        
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
        }
        
        // empty input
        else {
            if RolesController.special["Fortune Teller"] != nil {
                RolesController.map.removeValue(forKey:RolesController.special["Fortune Teller"]!)
                    RolesController.special["Fortune Teller"] = nil
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
