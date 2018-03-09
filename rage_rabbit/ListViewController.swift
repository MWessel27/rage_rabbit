//
//  ListViewController.swift
//  rage_rabbit
//
//  Created by Mikal Wessel on 3/9/18.
//  Copyright © 2018 persever. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var inptBox: UITextField!
    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet weak var prodTbl: UITableView!
    
    var products: [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodTbl.dataSource = self as? UITableViewDataSource;
        
        if(products.count == 0){
            prodTbl.isHidden = true;
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        if(self.inptBox.text?.isEmpty == false) {
            let prodName = self.inptBox.text;
            products.append(prodName!);
            
            prodTbl.beginUpdates();
            prodTbl.insertRows(at: [
                NSIndexPath(row: products.count-1, section: 0) as IndexPath
                ], with: .automatic);
            prodTbl.endUpdates();
            prodTbl.isHidden = false;
            self.inptBox.text = "";
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.products.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade);
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        cell.textLabel?.textAlignment = .center;
        
        let text = products[indexPath.row];
        
        cell.textLabel?.text = text;
        
        return cell;
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
