//
//  ThiefController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/10/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ThiefController: UIViewController {

    @IBOutlet weak var night_falls: UILabel!
    @IBOutlet weak var thiefTF: UITextField!
    
    var playerNumber = PlayerNumberController.num
    var thiefID = Int()
    
    
    override func viewDidLoad() {
        
//        let total = PlayerNumberController.num
//        thiefID = Int(thiefTF.text!)!
//        if(thiefID < 1 || thiefID > total){
//            let alert = UIAlertController(title: "Wrong Thief ID", message: "The thief ID could be only between 1 to " + String(total) + "(total number of players) players", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
