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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if wolf1TF.text == "" && wolf2TF.text == "" && wolf3TF.text == "" && wolf4TF.text == "" && wolf5TF.text == "" && wolf6TF.text == "" {
            let alert = UIAlertController(title: "Please enter Werewolf numbers", message: "You need at least one Werewolf", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            return false
        }
        
        if wolf1TF.text != "" {
            wolf1 = Int(wolf1TF.text!)!
        }
        if wolf2TF.text != "" {
            wolf2 = Int(wolf2TF.text!)!
        }
        if wolf3TF.text != "" {
            wolf3 = Int(wolf3TF.text!)!
        }
        if wolf4TF.text != "" {
            wolf4 = Int(wolf4TF.text!)!
        }
        if wolf5TF.text != "" {
            wolf5 = Int(wolf5TF.text!)!
        }
        if wolf6TF.text != "" {
            wolf6 = Int(wolf6TF.text!)!
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
