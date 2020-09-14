//
//  RoleConformationController.swift
//  Werewolf
//
//  Created by Kay Lu on 8/30/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class StartPointController: UIViewController {
    
    var player = String()
    @IBOutlet weak var gameStartLabel: UILabel!
    @IBOutlet weak var shuffleCardLabel: UILabel!
    @IBOutlet weak var extraCardLabel: UILabel!
    
    override func viewDidLoad() {
        // hide the first night labels
        if RolesController.nextNight == true {
            gameStartLabel.isHidden = true
            shuffleCardLabel.isHidden = true
            extraCardLabel.isHidden = true
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
