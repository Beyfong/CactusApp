//
//  LeadersListViewController.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class LeadersListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
     
    let leadersStorage = LeadersStorage()
    @IBOutlet var LeadersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Leaderboard"
        
        LeadersTableView.dataSource = self
        LeadersTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        LeadersTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leadersStorage.leaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaderCell =  LeadersTableView.dequeueReusableCell(withIdentifier: "leader_cell", for: indexPath) as! LeadersListTableViewCell
        let leader = leadersStorage.leaders[indexPath.row]
        
        leaderCell.configure(with: leader, position: indexPath.row + 1)
        return leaderCell
    }
    
    
    
 
}
