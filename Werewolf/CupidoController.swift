//
//  CupidoController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/17/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class CupidoController: UIViewController {
    
    static var cupido = -1

    @IBOutlet weak var cupidoTF: UITextField!
    @IBOutlet weak var cupidoIntroLabel1: UILabel!
    @IBOutlet weak var cupidoIntroLabel2: UILabel!
    @IBOutlet weak var cupidoLabel: UILabel!
    
    //    @IBAction func showRoles(_ sender: Any) {
//        self.performSegue(withIdentifier: "RolesController", sender:self)
//    }
    
    override func viewDidLoad() {
        if RolesController.special["Cupido"] != nil {
            cupidoTF.text = String(RolesController.special["Cupido"]!)
        }
        
        if RolesController.nextNight == true {
            cupidoTF.isHidden = true
            cupidoLabel.isHidden = true
            cupidoIntroLabel1.isHidden = true
            cupidoIntroLabel2.isHidden = true
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func check() -> Bool {
        if cupidoTF.text != "" {
            let cupidoID = Int(cupidoTF.text!)!
            CupidoController.cupido = Int(cupidoTF.text!)!
            // out of range
            if cupidoID < 1 || cupidoID > PlayerNumberController.num {
                
                let alert = UIAlertController(title: "The Cupido ID is out of range", message: "The Cupido number could be only between 1 to " + String(PlayerNumberController.num) + ".", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
                return false
            }
            
            // if the ID is conflicted to other roles
            if RolesController.map[cupidoID] != nil && RolesController.map[cupidoID] != "Cupido"  {
                let alert = UIAlertController(title: "The Cupido ID is conflicted with another role", message: "This ID number has already been assigned to " + String(RolesController.map[cupidoID]!) + ".", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
            
            // if Cupido ID is nil or changed
            if RolesController.special["Cupido"] == nil{
                RolesController.special["Cupido"] = cupidoID
                RolesController.map[cupidoID] = "Cupido"
            }
            else if RolesController.special["Cupido"] != cupidoID {
                RolesController.map.removeValue(forKey:  RolesController.special["Cupido"]!)
                RolesController.special["Cupido"] = cupidoID
                RolesController.map[cupidoID] = "Cupido"
            }
            RolesController.third.insert(cupidoID)
        }
        // else the text field is empty
        else {
            if RolesController.special["Cupido"] != nil {
                RolesController.map.removeValue(forKey: RolesController.special["Cupido"]!)
                RolesController.special["Cupido"] = nil
                CupidoController.cupido = -1
            }
            RolesController.third = Set<Int>()
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
