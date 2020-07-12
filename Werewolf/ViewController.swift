//
//  ViewController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/27/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var testView: TestView!
    override func viewDidLoad() {
        // need to refresh the game
        refresh()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        testView.label.text = "successful!"
//        testView.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh() {
        // refresh all the previous settings
        PlayerNumberController.num = Int()
        CupidoController.cupido = -1
        RolesController.lover1 = -1
        RolesController.lover2 = -1
        RolesController.third = Set<Int>()
        RolesController.littleGirlDetection = 0
        RolesController.wolves = Set<Int>()
        RolesController.potentialVictim = -1
        RolesController.healing = 1
        RolesController.poison = 1
        RolesController.potentialPoison = -1
        RolesController.sheriff = -1
        RolesController.map = [Int : String]()
        RolesController.special = [String : Int]()
        RolesController.alive = Set<Int>()
        print(PlayerNumberController.num)
    }

}

