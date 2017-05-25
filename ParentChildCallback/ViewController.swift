//
//  ViewController.swift
//  ParentChildCallback
//
//  Created by Ciprian Rarau on 2017-05-25.
//  Copyright © 2017 Ciprian Rarau. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        if let view = Bundle.main.loadNibNamed("TimerView", owner: self, options: nil)?[0] as? TimerView  {
            self.view.addSubview(view)
            view.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(66)
                make.center.equalToSuperview()
            }
            
            view.callback = { counter in
                self.counterLabel.text = String(counter)
            }
        }
    }

}

