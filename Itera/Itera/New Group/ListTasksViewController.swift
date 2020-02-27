//
//  ListTasksViewController.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit

class ListTasksViewController: UIViewController {

    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var addTracingButton: UIButton!
    
    @IBOutlet weak var tableTaskView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButtons()
        settingTable()
        // Do any additional setup after loading the view.
    }
    
    func settingTable(){
        tableTaskView.delegate = self
    }
    func settingButtons(){
        storeButton.backgroundColor = UIColor(red: 241/255, green: 91/255 ,blue: 35/255, alpha: 1.0)
        storeButton.layer.masksToBounds = true
        storeButton.layer.cornerRadius = 5
        
        addTracingButton.backgroundColor = UIColor(red: 78/255, green: 85/255 ,blue: 106/255, alpha: 1.0)
        addTracingButton.layer.masksToBounds = true
        addTracingButton.layer.cornerRadius = 5
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListTasksViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //taskcell
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskcell") as! ListTaskTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 211
       }
}
