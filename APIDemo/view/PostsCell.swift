//
//  PostsCell.swift
//  APIDemo
//
//  Created by Kushal Rana on 20/07/22.
//

import UIKit

// 
class PostsCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
