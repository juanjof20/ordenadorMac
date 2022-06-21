//
//  MyCell.swift
//  pushJuanjo
//
//  Created by Juanjo
//

import UIKit

class MyCell: UITableViewCell
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    @IBOutlet var messLB: UILabel!
    @IBOutlet var messSLB: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
