//
//  ListTaskTableViewCell.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit

class ListTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var backgrounTaskView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgrounTaskView.layer.cornerRadius = 10
        backgrounTaskView.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
