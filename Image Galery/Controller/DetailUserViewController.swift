//
//  DetailUserViewController.swift
//  Image Galery
//
//  Created by jairo cruz on 3/20/19.
//  Copyright © 2019 jairo cruz. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailUserViewController: UIViewController {

    //@IBOutlet weak var userDetailLabel: UILabel!
    var name : String?
    var imageDetailV : String?
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // userDetailLabel.text = name
        let urlImage = URL(string: imageDetailV!)
        imageDetail.af_setImage(withURL: urlImage!)

        // Do any additional setup after loading the view.
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
