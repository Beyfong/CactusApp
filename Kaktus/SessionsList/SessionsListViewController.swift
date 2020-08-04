//
//  SessionsListViewController.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class SessionsListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
     
    
    
    @IBOutlet var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sessions"
        
        TableView.dataSource = self
        TableView.delegate = self
 
    }
    
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         
        TableView.reloadData()
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionsStorage.shared.sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sessionCell = TableView.dequeueReusableCell(withIdentifier: "session_cell", for: indexPath) as! SessionsListTableViewCell
        let session = SessionsStorage.shared.sessions[indexPath.row]
        sessionCell.configure(with: session)
        return sessionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect")
    }
    

    

}
