//
//  AllNewsCell.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit

class AllNewsCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var autherName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
