//
//  ViewController.swift
//  Countries
//
//  Created by alexander on 22.11.2019.
//  Copyright © 2019 alexander. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true

        
        let fileName = "countries.json"
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        if let data = try? Data(contentsOf: url) {
            if let decoded = try? JSONDecoder().decode([Country].self, from: data) {
                countries = decoded
            } else {
                fatalError("Failed to decode \(fileName)")
            }
        } else {
            fatalError("Failed to get data from url file \(fileName)")
        }
    }
    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return countries.count
    }

    // Returns cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryName", for: indexPath)
        cell.textLabel?.text = self.countries[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.country = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
