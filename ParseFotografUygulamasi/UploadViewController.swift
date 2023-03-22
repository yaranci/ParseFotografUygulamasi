//
//  UploadViewController.swift
//  ParseFotografUygulamasi
//
//  Created by imrahor on 17.02.2023.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yorum: UITextField!
    @IBOutlet weak var PaylasButtonu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeKapa))
        view.addGestureRecognizer(keyboardRecognizer)

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        PaylasButtonu.isEnabled = false
        
    }
    
    @objc func gorselSec() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
        PaylasButtonu.isEnabled = true
    }
    
    @objc func klavyeKapa() {
        view.endEditing(true)
    }
    
    
    @IBAction func paylasTiklandi(_ sender: Any) {
        PaylasButtonu.isEnabled = false
        
        let post = PFObject(className: "Post")
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        if let data = data {
            if PFUser.current() != nil {
                let parseImage = PFFileObject(name: "image.jpg", data: data)
                post["postyorum"] = yorum.text
                post["postsahibi"] = PFUser.current()?.username
                post["postgorsel"] = parseImage
                
                post.saveInBackground { success, error in
                    if error != nil {
                        let alert = UIAlertController(title: "Hata", message: error?.localizedDescription ?? "Hata", preferredStyle: .alert)
                        let okbutton = UIAlertAction(title: "OK", style: .default)
                        alert.addAction(okbutton)
                        self.present(alert, animated: true)
                    } else {
                        self.yorum.text = ""
                        self.imageView.image = UIImage(named: "gorselSec")
                        self.tabBarController?.selectedIndex = 0
                        
                        NotificationCenter.default.post(name: NSNotification.Name("yeniPost"), object: nil)
                    }
                }
            }
        }
    }
    
    
}
