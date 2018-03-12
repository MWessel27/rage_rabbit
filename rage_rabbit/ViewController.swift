//
//  ViewController.swift
//  rage_rabbit
//
//  Created by Mikal Wessel on 3/9/18.
//  Copyright © 2018 persever. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayLbl: UILabel!
    
    var dayStr = String("Today")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dayLbl.text = dayStr
        if(dayLbl.text == "") {
            dayLbl.text = "Today"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

