//
//  RoleConformationController.swift
//  Werewolf
//
//  Created by Kay Lu on 3/14/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class RoleConformationController:

UIViewController {
    
    var player = String()
    
    var roles = [UITextField]()

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = player
        var p = Int(player)
        // Do any additional setup after loading the view.
        for i in 0...p!-1 {
            //let textField = UITextField((frame: CGRect(x: X, y: Y*i, width: 1, height: 1)))
            //textField.delegate = self
            //roles.append(textField)
        }
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
