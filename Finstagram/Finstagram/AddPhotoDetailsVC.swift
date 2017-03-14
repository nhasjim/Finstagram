//
//  AddPhotoDetailsVC.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/13/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit

class AddPhotoDetailsVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var finstaPic: UIImageView!
    @IBOutlet weak var captionField: UITextView!
    @IBOutlet weak var locationField: UITextField!
    
    var originalImage: UIImage!
    var resizedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ===========CAPTION STUFFFFF
        captionField.delegate = self
        captionField.layer.borderWidth = 1
        captionField.layer.borderColor = UIColor.black.cgColor
        captionField.layer.cornerRadius = 6;
        captionField.clipsToBounds = true;
        captionField.text = "Write a caption..."
        captionField.textColor = UIColor.lightGray
        
        

        //============= IMAGE STUFF
        print(resizedImage.debugDescription)
        finstaPic.image = resizedImage;
        finstaPic.layer.cornerRadius = 6;
        finstaPic.clipsToBounds = true;

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        captionField.setContentOffset(CGPoint.zero, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func onShareClick(_ sender: Any) {
        Post.postUserImage(image: originalImage, withCaption: captionField.text) { (success: Bool, error: Error?) in
            
            
            self.performSegue(withIdentifier: "postSegue", sender: nil)
        }
    }
    

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write a caption..."
            textView.textColor = UIColor.lightGray
        }
        else{
            textView.resignFirstResponder()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
