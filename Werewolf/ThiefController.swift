//
//  ThiefController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/10/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ThiefController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var night_falls: UILabel!
    @IBOutlet weak var thiefIntroLabel1: UILabel!
    @IBOutlet weak var thiefIntroLabel2: UILabel!
    @IBOutlet weak var thiefIntroLabel3: UILabel!
        
    override func viewDidLoad() {
        
        if RolesController.nextNight == true {
            thiefIntroLabel1.isHidden = true;
            thiefIntroLabel2.isHidden = true;
            thiefIntroLabel3.isHidden = true;
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
