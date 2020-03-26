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
    
    // map of special roles(like Hunter/Future Teller, etc)
    static var special = [String : Int]()
    // map of roles -> list of id
//    static var group = [String : Set<Int>]()
    static var wolves = Set<Int>()
    static var lover1 = -1
    static var lover2 = -1
    // map for all existing id
    static var map = [Int : String]()
    
    // string of all roles
    var roles = ""
    static var sheriff = -1;
    static var alive = Set<Int>()
//    static var potentialVictim = -1
    static var potentialVictim = Set<Int>()
    
    static var healing = 1;
    static var poison = 1;

    override func viewDidLoad() {
        for (key,value) in RolesController.special {
            //            content.text! += "\(key): \(value) \n"
            roles += "\(key): \(value) \n"
//            print("\(key) = \(value)")
        }
        if RolesController.wolves.capacity > 0 {
            roles += "Wolves: "
            for wid in RolesController.wolves {
//            content.text! += "\(key): \(value)\n"
                roles += "\(wid) "
//            print("\(key) = \(value)")
            }
            roles += "\n"
        }
        print(roles)
        content.text = roles;
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
