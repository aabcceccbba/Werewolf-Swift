//
//  RolesController.swift
//  Werewolf
//
//  Created by Kay Lu on 5/5/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class RolesController: UIViewController {
    
    @IBOutlet weak var content: UILabel!
    
    // map of roles -> list of id
    static var map = [String : Set<Int>]()
    // set of all existing id
    static var set = Set<Int>()

    override func viewDidLoad() {
        for (key,value) in RolesController.map {
            content.text! += "\(key): \(value)\n"
            print("\(key) = \(value)")
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
