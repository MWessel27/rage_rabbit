//
//  ViewController.swift
//  rage_rabbit
//
//  Created by Mikal Wessel on 3/9/18.
//  Copyright © 2018 persever. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var dayView: UIView!
    
    @IBOutlet weak var dayBtn: UIButton!
    @IBOutlet weak var nightBtn: UIButton!
    
    var dayViewActive = Bool();
    
    @IBOutlet weak var prodListTable: UITableView!
    
    var productList = ["productA", "productB", "productC", "productD"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        cell.textLabel?.text = productList[indexPath.row];
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none;
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark;
        }
    }
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter
    }()
    
    @IBAction func dayBtnTped(_ sender: Any) {
        prodListTable.isHidden = true;
        let duration: TimeInterval = 1.0
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.nightBtn.frame = CGRect(
                x: self.nightBtn.frame.origin.x,
                y: self.nightBtn.frame.origin.y + 350,
                width: self.nightBtn.frame.size.width,
                height: self.nightBtn.frame.size.height)
        }, completion: { (finished: Bool) in
            self.prodListTable.frame = CGRect(x: self.prodListTable.frame.origin.x, y: self.prodListTable.frame.origin.y - 100, width: self.prodListTable.bounds.width, height: self.prodListTable.bounds.height)
            self.prodListTable.isHidden = false;
        })
        dayBtn.isEnabled = false;
        nightBtn.isEnabled = true;
    }
    
    @IBAction func nightBtnTped(_ sender: Any) {
        prodListTable.isHidden = true;
        let duration: TimeInterval = 1.0
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.nightBtn.frame = CGRect(
                x: self.nightBtn.frame.origin.x,
                y: self.nightBtn.frame.origin.y - 350,
                width: self.nightBtn.frame.size.width,
                height: self.nightBtn.frame.size.height)
        }, completion: { (finished: Bool) in
            self.prodListTable.frame = CGRect(x: self.prodListTable.frame.origin.x, y: self.prodListTable.frame.origin.y + 100, width: self.prodListTable.bounds.width, height: self.prodListTable.bounds.height)
            self.prodListTable.isHidden = false;
        })
        nightBtn.isEnabled = false;
        dayBtn.isEnabled = true;
    }
    
    var dayStr = String("Today")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodListTable.dataSource = self as UITableViewDataSource;
        prodListTable.delegate = self as UITableViewDelegate;
        prodListTable.isEditing = false;
        prodListTable.allowsSelection = true;
        
        // Do any additional setup after loading the view, typically from a nib.
        dayLbl.text = dayStr
        if(dayLbl.text == "") {
            dayLbl.text = "Today"
        }
        
        let today = self.dateFormatter.string(from: Date())

        if((today as NSString).integerValue < 12) {
            dayViewActive = true;
        } else {
            dayViewActive = false;
        }

        if(dayViewActive) {
            dayBtn.isEnabled = false;
        } else {
            nightBtnTped((Any).self);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

