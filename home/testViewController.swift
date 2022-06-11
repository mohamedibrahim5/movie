//
//  testViewController.swift
//  home
//
//  Created by mohamed ibrahim on 11/06/2022.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = UIImage(named: "test.jpeg")
        let image : UIImage = UIImage(named: "test.jpeg")!
        
        let imastring = imageview.image?.jpegData(compressionQuality: 1)?.base64EncodedString()
        print(imastring!)
        
        
        let imagedata = NSData (base64Encoded: imastring!)
        
        let imageed = UIImage(data: imagedata as! Data)
        
        im.image = imageed
      

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
