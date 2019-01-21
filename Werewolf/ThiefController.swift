//
//  ThiefController.swift
//  Werewolf
//
//  Created by Kay Lu on 9/10/18.
//  Copyright © 2018 a. All rights reserved.
//

import UIKit

class ThiefController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var night_falls: UILabel!
    @IBOutlet weak var thiefTF: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let roles = ["Werewolf", "Townfolk", "Fortune Teller", "Hunter", "Cupdo", "Witch", "Little Girl"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // number of rows in the picker view
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // content of each row
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
    
    var playerNumber = PlayerNumberController.num
    var thiefID = Int()
    
    
    override func viewDidLoad() {
        
//        let total = PlayerNumberController.num
//        thiefID = Int(thiefTF.text!)!
//        if(thiefID < 1 || thiefID > total){
//            let alert = UIAlertController(title: "Wrong Thief ID", message: "The thief ID could be only between 1 to " + String(total) + "(total number of players) players", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hide the keyboard when touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
