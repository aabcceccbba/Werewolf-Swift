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
    
    override func viewDidLoad() {
        print("alive:")
        print(RolesController.alive)
        // else continue the game
        resultLabel.text = "Game is continuing. Night falls~ The town is asleep, and everyone closes their eyes."

        // check if the game is end
        if(RolesController.special["Cupido"] != nil){
            // third party set contains alive -> third party win
            if(RolesController.alive.isSubset(of: RolesController.third)){
                resultLabel.text = "Game ends! The Third Party wins the game! :3"
            }
        }
        // wolves set contains alive -> wolves win
        if(RolesController.alive.isSubset(of: RolesController.wolves)){
            resultLabel.text = "Game ends! The Wolves win the game! :D"
        }
        // none of the wolves is alive -> townfolks win
        if(RolesController.alive.isDisjoint(with: RolesController.wolves)){
            resultLabel.text = "Game ends! The Townfolks win the game! :D"
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
