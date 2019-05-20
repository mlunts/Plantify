//
//  PlantViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 5/20/19.
//  Copyright © 2019 earine. All rights reserved.
//

import UIKit

class PlantViewController: UIViewController {
    
    public var newImage: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var classifiedString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = newImage
        print(classifiedString)
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
