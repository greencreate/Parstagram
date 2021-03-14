//
//  CameraViewController.swift
//  Parstagram
//
//  Created by Joey Steigelman on 3/7/21.
//

import UIKit
import AlamofireImage
import Parse


class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommentField()
        configureSubmitButton()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let post = PFObject(className: "Posts")
        
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                //dismiss screen after post and return to feed view
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            } else {
                print("Error")
            }
        }
        
    }
    

    @IBAction func onCameraButton(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func configureCommentField() {

        commentField.layer.cornerRadius = 6
        commentField.layer.borderWidth = 1
        commentField.layer.borderColor = UIColor.purple.cgColor

        
        /*
        let gradient = CAGradientLayer()
            gradient.frame =  CGRect(origin: CGPoint.zero, size: self.commentField.frame.size)
            gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]

            let shape = CAShapeLayer()
            shape.lineWidth = 2
        shape.cornerRadius = 8
            shape.path = UIBezierPath(rect: self.commentField.bounds).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            gradient.mask = shape
        self.commentField.clipsToBounds = true

            self.commentField.layer.addSublayer(gradient)

    */
        
        }
    
    func configureSubmitButton() {
        submitButton.layer.cornerRadius = 6
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
