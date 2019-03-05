//
//  ViewController.swift
//  Werewolf
//
//  Created by Kay Lu on 2/27/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: TestView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testView.label.text = "successful!"
        testView.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

