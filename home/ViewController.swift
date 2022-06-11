//
//  ViewController.swift
//  home
//
//  Created by mohamed ibrahim on 11/06/2022.
//

import UIKit
class ViewController: UIViewController, addingtext ,addingimage {
    var arrimage: [UIImage] = [
        UIImage(named: "test.jpeg")!
    ]
    @IBOutlet weak var imagetest: UIImageView!
    //Use image name from bundle to create NSData

    @IBOutlet weak var tableview: UITableView!
    func addtext(name: String) {
     //   firsttext.text = name
        Movie.moviestitle.append(name)
        tableview.reloadData()
    }
    func addimage(image: UIImage) {
    //    imagetest.image = image
        arrimage.append(image)
        tableview.reloadData()
    }
    

    @IBAction func y(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cell")
        as! firstViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.x = self
        vc.y = self
    }
    @IBOutlet weak var firsttext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var mov1 = Movie(title: "iron man",image: "image")
    }

}


class Movie
{
    var title : String?
    var image : String?
    static var moviestitle : [String] = []
    static var moviesimage : [String] = []
    init(title : String,image :String)
    {
        self.title = title
        self.image = image
        Movie.moviestitle.append(title)
        Movie.moviesimage.append(image)
        
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
        cell.imageview.image = arrimage[indexPath.row]
        
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




