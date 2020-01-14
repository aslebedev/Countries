//
//  DetailViewController.swift
//  Countries
//
//  Created by alexander on 22.11.2019.
//  Copyright © 2019 alexander. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var country: Country!
    var countryInfo: [String] {
        var array = [String]()
        let mirror = Mirror(reflecting: country as Country)
        for property in mirror.children {
            let label = property.label != nil ? property.label! + ": " : ""
            let value = String(describing: property.value)
            if !value.isEmpty {
                array.append(label.capitalizedFirst + value)
            }
        }
        return array
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country.name
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
