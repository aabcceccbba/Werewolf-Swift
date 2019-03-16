//
//  TestView.swift
//  Werewolf
//
//  Created by Kay Lu on 3/2/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var label: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func hide(_ sender: Any) {
//        view.isHidden = true;
        view.removeFromSuperview();
    }
    
    override init(frame: CGRect) {
        // for using custom view in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder){
        // for using custome view in IB
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit(){
        // do stuff here
        Bundle.main.loadNibNamed("testView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
