//
//  DetailViewController.swift
//  Countries
//
//  Created by alexander on 22.11.2019.
//  Copyright © 2019 alexander. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var countryInfo = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryInfo.count
    }

        // Returns cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryDetail", for: indexPath)
        cell.textLabel?.text = countryInfo[indexPath.row]
        return cell
    }
}
