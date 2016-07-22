//
//  UglyCell.swift
//  CustomTableView
//
//  Created by Dino Musliu on 20/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import UIKit

class UglyCell: UITableViewCell {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImg.layer.cornerRadius = 5.0
        mainImg.clipsToBounds = true
        
        //
    }

    
    func configureCell(image: UIImage, text: String){
        mainImg.image = image
        mainLbl.text = text
    }

}
