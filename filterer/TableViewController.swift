//
//  TableViewController.swift
//  filterer
//
//  Created by Habiba Bassem on 1/2/19.
//  Copyright © 2019 Habiba Bassem. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let filters = [
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Yellow",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (filters[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath)
        cell.textLabel?.text = filters[indexPath.row]
        return cell
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
