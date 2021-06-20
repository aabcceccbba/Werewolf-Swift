//
//  Check.swift
//  Werewolf
//
//  Created by Kay Lu on 6/20/21.
//  Copyright © 2021 a. All rights reserved.
//

import UIKit

class Check: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alert(controller: UIViewController, role: String, type: String) {
        var title = "Error";
        var message = "";
        
        if type == "out of range" {
            title = "The input ID is " + type
            message = "The " + role + " number could be only between 1 to " + String(PlayerNumberController.num) + "."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
    
    func check(controller: UIViewController, TF: UITextField, role: String) -> Bool {
        let id = Int(TF.text!)!
        
        // out of players range
        if id < 1 || id > PlayerNumberController.num {
            alert(controller: controller, role: role, type: "out of range")
            return false
        }
        
        return true
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
