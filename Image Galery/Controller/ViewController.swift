//
//  ViewController.swift
//  Image Galery
//
//  Created by jairo cruz on 3/15/19.
//  Copyright © 2019 jairo cruz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // TODO: CONSTANTS
    let PIXABAY_URL = "https://pixabay.com/api/"
    let CellIdentifier = "myCustomCellView"
   
    
    // TODO: Instance variables
    //var imageDataModel = ImageDataModel()
    var listImage : [ImageDataModel] = []
    
    // TODO: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params : [String : String] = ["key" : Util.API_KEY]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getData(url: PIXABAY_URL, parameters: params)
        
        
    }
    
    
   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Este es mi seleccion: \(data[indexPath.row])")
        name = data[indexPath.row]
        print("metodo \(name!)")
        performSegue(withIdentifier: "goDetailView", sender: self)
        
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCellView", for: indexPath) as! myTableViewCell
        let imageModel = self.listImage[indexPath.row]
        cell.userNameLabel?.text = imageModel.user
        let url = URL(string: imageModel.userImageUrl)
        let urlImage = URL(string: imageModel.imageUrl)
        cell.userProfileImageView?.af_setImage(withURL: url!)
        cell.imageUserView?.af_setImage(withURL: urlImage!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listImage.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "goDetailView" {
            //let detailViewController = segue.destination as! DetailUserViewController
           // detailViewController.name = name!
            
        }*/
        
        
       guard let detail = segue.destination as? DetailUserViewController,
            let index = tableView.indexPathForSelectedRow?.row
        
        else {
            return
        }
        let imageModel = self.listImage[index]
        detail.name = imageModel.user
        detail.imageDetailV = imageModel.imageUrl
    }
    
    // MARK: GET DATA USED ALMOFIRE REQUEST
    func getData(url: String, parameters: [String: String]) {
        
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success got the data")
                
                let dataImageJSON : JSON = JSON(response.result.value!)
                
                self.updateImageData(json: dataImageJSON)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } else {
                print("Error \(response.result.error ?? "Error desconocido" as! Error)")
            }
            
        }
        
        
    }
    
    // MARK: JSON Parsing
    func updateImageData(json : JSON) {
        
        let hits = json["hits"]
        print(hits)
        
        for(_,imageModel) in hits {
            
            self.listImage.append(ImageDataModel(user: imageModel["user"].stringValue, userImageUrl: imageModel["userImageURL"].stringValue, imageUrl: imageModel["webformatURL"].stringValue))
            
        }
        
        
    }


}

