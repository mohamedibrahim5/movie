//
//  ViewController.swift
//  home
//
//  Created by mohamed ibrahim on 11/06/2022.
//

import UIKit
class ViewController: UIViewController, addingtext {
    @IBOutlet weak var tableview: UITableView!
    func addtext(name: String) {
     //   firsttext.text = name
        Movie.moviestitle.append(name)
        tableview.reloadData()
    }
    

    @IBAction func y(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cell")
        as! firstViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.x = self
    }
    @IBOutlet weak var firsttext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var mov1 = Movie(title: "iron man")
        var mov2 = Movie(title: "bat man")
    }


}


class Movie
{
    var title : String?
    static var moviestitle : [String] = []
    init(title : String)
    {
        self.title = title
        Movie.moviestitle.append(title)
        
    }
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movie.moviestitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textout.text = Movie.moviestitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "celll")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
extension ViewController : UITableViewDelegate
{
    
}
