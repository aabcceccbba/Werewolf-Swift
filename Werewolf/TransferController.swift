//
//  TransferController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/9/20.
//  Copyright © 2020 a. All rights reserved.
//

import UIKit

class TransferController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nextNightButton: UIButton!
    
    override func viewDidLoad() {
//        nextNightButton.isHidden =
        print("TransferController alive:")
        print(RolesController.alive)
        // else continue the game
        resultLabel.text = "Game is continuing. Night falls~ The town is asleep, and everyone closes their eyes."

        // check if the game is end
        if(RolesController.special["Cupido"] != nil){
            // third party set contains alive -> third party win
            if(RolesController.alive.isSubset(of: RolesController.third)){
                resultLabel.text = "Game ends! The Third Party wins the game! :3"
                nextNightButton.isHidden = true
            }
        }
        // wolves set contains alive -> wolves win
        if(RolesController.alive.isSubset(of: RolesController.wolves)){
            resultLabel.text = "Game ends! The Wolves win the game! :D"
            nextNightButton.isHidden = true
        }
        // none of the wolves is alive -> townfolks win
        if(RolesController.alive.isDisjoint(with: RolesController.wolves)){
            resultLabel.text = "Game ends! The Townfolks win the game! :D"
            nextNightButton.isHidden = true
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "restart" {
            // alert before restart the game
            let finalAlert = UIAlertController(title: "Are you sure to restart the game?", message: "You won't be able to access the previous game.", preferredStyle: .alert)
            
            finalAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.performSegue(withIdentifier: "restart", sender: nil)

            }))
            
            finalAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(finalAlert, animated: true)
        }
        
        if identifier == "nextNight" {
            RolesController.nextNight = true
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
