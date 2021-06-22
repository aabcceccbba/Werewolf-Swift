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
    
    var checkObject = Check()
    
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
                checkObject.alert(controller: self, role: "Cupido", id: cupidoID, type: "out of range")
                return false
            }
                        
            // if the ID is conflicted to other roles
            if RolesController.map[cupidoID] != nil && RolesController.map[cupidoID] != "Cupido"  {
                checkObject.alert(controller: self, role: "Cupido", id: cupidoID, type: "conflict roles")
                return false
            }
            
            // if Cupido ID is nil or changed
            checkObject.updateSpecial(role: "Cupido", id: cupidoID)
        }
        // else the text field is empty
        else {
            checkObject.clearSpecial(role: "Cupido")
            CupidoController.cupido = -1
            RolesController.third = Set<Int>()
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
