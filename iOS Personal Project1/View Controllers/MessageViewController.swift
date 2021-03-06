//
//  MessageViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/25/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var myTable: UITableView!
    override func viewDidLoad(){
        super.viewDidLoad()
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "John Smith"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        Show chat message
        let vc = ChatViewController()
        vc.title = "Chat"
        navigationController?.pushViewController(vc, animated: true)
    }
}
