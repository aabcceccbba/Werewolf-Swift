//
//  SheriffController.swift
//  Werewolf
//
//  Created by Kay Lu on 10/27/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class SheriffController: UIViewController {
    
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var sheriffTF: UITextField!
    // set random place to start the sheriff vote;
    // get the total number of the player first
    var a = PlayerNumberController.num
    override func viewDidLoad() {
        if RolesController.sheriff != -1 {
            sheriffTF.text = String(RolesController.sheriff)
        }
        var r = arc4random_uniform(UInt32(Int(a))) + 1
        var clock = arc4random_uniform(2);
        var dir = String();
        if(clock == 0){
            dir = " ";
        }
        else{
            dir = " counter-";
        }
        print(r)
        start.text = "Starts from player #" + String(r) + dir + "clockwise"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func check() -> Bool {
        if sheriffTF.text != "" {
        
            let sheriff = Int(sheriffTF.text!)!
            // out of range
            if sheriff > PlayerNumberController.num || sheriff < 1 {
                let alert = UIAlertController(title: "Please enter the right Sheriff ID", message: "Sheriff ID should be only between 1 and " + String(PlayerNumberController.num), preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
            
            // update Sheriff ID
            RolesController.sheriff = sheriff
        }
        
        // empty
        else {
            RolesController.sheriff = -1
        }
        
        return true
    }
    
    // check if the input number is valid
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return check()
    }
    
    // used to implement back bar button update
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParentViewController {
            if check(){
            }
        }
    }
    
    // hide the keyboard when touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
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
