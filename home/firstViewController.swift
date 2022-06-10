//
//  firstViewController.swift
//  home
//
//  Created by mohamed ibrahim on 11/06/2022.
//

import UIKit
protocol addingtext
{
    func addtext(name : String)
}
class firstViewController: UIViewController {
    var x : addingtext?

    @IBAction func yy(_ sender: UIButton) {
      //  dismiss(animated: true , completion: nil)
        navigationController?.popViewController(animated: true)
        x?.addtext(name: secondtext.text!)
    }
    @IBOutlet weak var secondtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
