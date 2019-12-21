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
        var r = arc4random_uniform(UInt32(Int(a))) + 1
        var clock = arc4random_uniform(2);
        var dir = String();
        if(clock == 0){
            dir = " ";
        }
        else{
            dir = " conter-";
        }
        print(r)
        start.text = "Starts from player #" + String(r) + dir + "clockwise"
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
