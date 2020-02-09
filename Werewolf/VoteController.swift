//
//  VoteController.swift
//  Werewolf
//
//  Created by Kay Lu on 11/18/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class VoteController: UIViewController {

    @IBOutlet weak var eliminateTF: UITextField!
    
    override func viewDidLoad() {
        // hide the back button to prevent going back
        navigationItem.hidesBackButton = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // empty input
        if eliminateTF.text == "" {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "Retaliated Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            return false
        }
        
        let eliminate = Int(eliminateTF.text!)!
        // out of range
        if eliminate > PlayerNumberController.num || eliminate < 1 {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "Retaliated Victim ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        
        // already dead
        if !RolesController.alive.contains(eliminate) {
            let alert = UIAlertController(title: "Please enter the right retaliated Victim ID", message: "This player is already dead.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        
        // update alive
    RolesController.alive.remove(RolesController.potentialVictim)
        // lover update...
        
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
