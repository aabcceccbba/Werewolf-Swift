//
//  ThiefController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/10/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ThiefController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var night_falls: UILabel!
    @IBOutlet weak var thiefTF: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var rolesView: UIView!
    
    var selected = String()
    var thiefID = Int()
    var playerNumber = PlayerNumberController.num
    
    func animateIn(){
        self.view.addSubview(rolesView)
        rolesView.center = self.view.center
        
        rolesView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        rolesView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.rolesView.alpha = 1
            self.rolesView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.rolesView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.rolesView.alpha = 0
        }) { (success) in
            self.rolesView.removeFromSuperview()
        }
    }
    
//    @IBAction func showRoles(_ sender: Any) {
//        animateIn()
//    }
    
    
    @IBAction func closeRoleView(_ sender: Any) {
        animateOut()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    let roles = ["Townfolk", "Werewolf", "Fortune Teller", "Hunter", "Cupido", "Witch", "Little Girl"]
    // in the future, "Lover" may be added
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // number of rows in the picker view
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // content of each row
        selected = roles[row]
        return roles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // number of rows
        return roles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // display something when select
        // optional
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        testView.isHidden = true;
//        self.thiefTF.delegate = self
        rolesView.layer.cornerRadius = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hide the keyboard when touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        if thiefTF.text != "" {
//            thiefID = Int(thiefTF.text!)!
//            if thiefID < 1 || thiefID > PlayerNumberController.num {
//
//                let alert = UIAlertController(title: "The player ID is out of range", message: "The player number could be only between 1 to " + String(PlayerNumberController.num) + ".", preferredStyle: .alert)
//
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//                self.present(alert, animated: true)
//
//                return false
//            }
    
            // update the role information
//            if selected == "Townfolk" || selected == "Werewolf"{
//                if RolesController.group[selected] == nil {
//                    RolesController.group[selected] = [thiefID]
//                }
//                else {
//                    RolesController.group[selected]!.insert(thiefID)
//                }
//            }
//            // for special roles
//            else{
//                if RolesController.special[selected] == nil {
//                    RolesController.special[selected] = thiefID
//                }
//            }
            
//            if RolesController.group[selected] == nil {
//                RolesController.group[selected] = [thiefID]
//            }
//            else {
//                RolesController.map[selected]!.insert(thiefID)
//            }
//            RolesController.set.insert(thiefID)
//        }
//
//
//        return true
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
