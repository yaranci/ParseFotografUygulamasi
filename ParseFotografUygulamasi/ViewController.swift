//
//  ViewController.swift
//  ParseFotografUygulamasi
//
//  Created by imrahor on 17.02.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var kullaniciText: UITextField!
    
    @IBOutlet weak var parolaText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func girisYapButton(_ sender: Any) {
        if kullaniciText.text! != "" && parolaText.text! != "" {
            PFUser.logInWithUsername(inBackground: kullaniciText.text!, password: parolaText.text!) { user, error in
                if error != nil {
                    self.hataMesaji(title: "HATA", message: error?.localizedDescription ?? "Kullanıcıya ulaşılamadı! Tekrar deneyin.")
                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        } else {
            hataMesaji(title: "HATA", message: "Kullanıcı adı ya da Parola hatası!")
        }
    }
    
    @IBAction func kayitOlButton(_ sender: Any) {
        
        if kullaniciText.text! != "" && parolaText.text! != "" {
            
            let user = PFUser()
            user.username = kullaniciText.text!
            user.password = parolaText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.hataMesaji(title:"Hata", message: error?.localizedDescription ?? "Hata")
                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        } else {
            
            self.hataMesaji(title: "Hata", message: "Kullanıcı adı ve/ya Parola giriniz!")
        }
    
    }
    
    
    func hataMesaji(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(button)
        self.present(alert, animated: true)
    }
    

}

