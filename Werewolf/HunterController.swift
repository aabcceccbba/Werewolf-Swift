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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // input number validation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if hunterTF.text != "" {
            let hunter = Int(hunterTF.text!)!
            if hunter > PlayerNumberController.num || hunter < 1 {
                let alert = UIAlertController(title: "Please enter the right Hunter ID", message: "Hunter ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
        }
        return true
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
