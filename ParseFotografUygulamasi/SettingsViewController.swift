//
//  SettingsViewController.swift
//  ParseFotografUygulamasi
//
//  Created by imrahor on 18.02.2023.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cikisYapTiklandi(_ sender: Any) {
        PFUser.logOutInBackground { error in
            if error != nil {
                let alert = UIAlertController(title: "Hata", message: error?.localizedDescription ?? "Çıkış yapılamadı!", preferredStyle: .alert)
                let button = UIAlertAction(title: "OK", style: .destructive)
                alert.addAction(button)
                self.present(alert, animated: true)
            } else {
                self.performSegue(withIdentifier: "toViewController", sender: nil)
            }
        }
    }

}
