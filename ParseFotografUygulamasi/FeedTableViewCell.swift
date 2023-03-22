//
//  FeedTableViewCell.swift
//  ParseFotografUygulamasi
//
//  Created by imrahor on 18.02.2023.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var kullaniciAdiLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var kullaniciYorumLavel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
