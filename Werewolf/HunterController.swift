//
//  HunterController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/25/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class HunterController: UIViewController {
    
    @IBOutlet weak var hunterTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // touch screen to remove keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
