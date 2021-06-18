//
//  PlayerNumberController.swift
//  Werewolf
//
//  Created by Kay Lu on 3/14/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class PlayerNumberController: UIViewController, UITextFieldDelegate {
    static var num = Int()
    
    @IBOutlet weak var playerNumberTF: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        if playerNumberTF.text != ""
        {
            PlayerNumberController.num = Int(playerNumberTF.text!)!
            if (PlayerNumberController.num < 8 || PlayerNumberController.num > 18) {
                let alert = UIAlertController(title: "The player number is out of range", message: "The number could be only between 8 to 18 players", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
            else{
                RolesController.alive = Set<Int>()
                for index in 1...PlayerNumberController.num {
                    RolesController.alive.insert(index)
                }
            }
        }
        else{
            let alert = UIAlertController(title: "Please enter a number", message: "The player number could be only between 8 to 18", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // notify the sague is about to perform
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.playerNumberTF.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
