//
//  RoleConformationController.swift
//  Werewolf
//
//  Created by Kay Lu on 3/14/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class RoleConformationController:

UIViewController, UITextFieldDelegate {
    
    var player = String()
    
    var roles = [UITextField]()

    //@IBOutlet weak var label: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*//label.text = player
        let p = Int(player)
        // Do any additional setup after loading the view.
        for i in 0...p!-1 {

            let textField = UITextField(frame: CGRect(x: 20, y: 50*i, width: 350, height: 40))
            textField.placeholder = "Enter text here " + String(i)
            textField.borderStyle = UITextBorderStyle.roundedRect
            textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            textField.delegate = self
            self.view.addSubview(textField)
            roles.append(textField)
        }
        //self.scrollView.contentSize = self.contentView.bounds.size * 2
 
 */
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
