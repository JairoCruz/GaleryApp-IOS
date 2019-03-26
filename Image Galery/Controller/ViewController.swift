//
//  ViewController.swift
//  Image Galery
//
//  Created by jairo cruz on 3/15/19.
//  Copyright © 2019 jairo cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let CellIdentifier = "myCustomCellView"
    var name : String?

    @IBOutlet weak var tableView: UITableView!
    let data = ["jairo","alberto","cruz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.estimatedRowHeight = 100
        
        
    }
    
    
   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Este es mi seleccion: \(data[indexPath.row])")
        name = data[indexPath.row]
        print("metodo \(name!)")
        performSegue(withIdentifier: "goDetailView", sender: self)
        
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! myTableViewCell
        cell.userNameLabel?.text = data[indexPath.row]
        cell.imageUserView?.image = UIImage(named: "ImageDummy")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "goDetailView" {
            //let detailViewController = segue.destination as! DetailUserViewController
           // detailViewController.name = name!
            
        }*/
       // guard let detail = segue.destination as? DetailUserViewController,
           // let index = tableView.indexPathForSelectedRow?.row
        //else {
          //  return
        //}
        //detail.name = data[index]
    }


}

