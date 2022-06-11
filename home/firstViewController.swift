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
protocol addingimage
{
    func addimage (image : UIImage)
}
class firstViewController: UIViewController {
    @IBOutlet weak var importedImg: UIImageView!
    var x : addingtext?
    var y : addingimage?

    @IBAction func yy(_ sender: UIButton) {
      //  dismiss(animated: true , completion: nil)
        navigationController?.popViewController(animated: true)
        x?.addtext(name: secondtext.text!)
        y?.addimage(image: importedImg.image!)
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

    @IBAction func importImageButtonAction(_ sender: UIButton) {
        openPhotoLibrary()
    }
    
    @IBAction func importFromCameraButtonAction(_ sender: UIButton) {
        openCamera()
    }
}

extension firstViewController: UIImagePickerControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        for img in info {
            if let image = img.value as? UIImage {
                self.importedImg.image = image
            }else{
                print("picking failed")
            }
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User has canceled the picking")
    }
}

extension firstViewController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("will open the Picker")
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("just opened the Picker")
    }
}

extension firstViewController{

    //MARK: openCamera() //Function to open the Camera
    func openCamera(){
        let imagePicker : UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){

            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            print("Camera Not available")
        }
    }

    //MARK: openPhotoLibrary()   //Function to open the Photo Library
    func openPhotoLibrary(){
        let imgPicker : UIImagePickerController = UIImagePickerController()
        imgPicker.delegate = self

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imgPicker.sourceType    = .photoLibrary
            imgPicker.allowsEditing = false
            self.present(imgPicker, animated: true, completion: nil)
        }else{
            print("Accessing Photo Library is not allowed")
        }
    }
}


/*
 extension ViewController{

     @IBAction func importImageButtonAction(_ sender: UIButton) {
         openPhotoLibrary()
     }

     @IBAction func importFromCameraButtonAction(_ sender: UIButton) {
         openCamera()
     }
 }
 */
