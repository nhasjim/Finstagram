//
//  UploadPhotoVC.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/12/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit

class UploadPhotoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var uploadedImage: UIImage?
    var resizedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCameraUpload(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraVC = UIImagePickerController()
            cameraVC.delegate = self
            cameraVC.allowsEditing = true
            cameraVC.sourceType = UIImagePickerControllerSourceType.camera
            self.present(cameraVC, animated: true, completion: nil)

        } else {
            print ("no camera available")
        }
        

    }
    
    @IBAction func onPhotoRollUpload(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)

    }

    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
//        Post.postUserImage(image: originalImage, withCaption: "Testing") { (success: Bool, error: Error?) in
//        }
        self.uploadedImage = originalImage
        self.resizedImage = editedImage
    
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        self.performSegue(withIdentifier: "AddDetailsSegue", sender: nil)

        dismiss(animated: true, completion: nil)

    
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "AddDetailsSegue") {
            let destination = segue.destination as! AddPhotoDetailsVC
            //destination.finstaPic.image = finstaPic
            if(self.uploadedImage == nil) {
                print("why is this nil")
            }
            print("not nil")
            destination.originalImage = self.uploadedImage
            destination.resizedImage = self.resizedImage
            
        }
    }

}
