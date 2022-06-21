//
//  MiCelda.swift
//  InterfazDiccionario
//
//  Created by A1-IMAC08 on 18/1/22.
//

import UIKit

class MiCelda: UITableViewCell
{
    @IBOutlet var palabraES: UILabel!
    @IBOutlet var imgES: UIImageView!
    @IBOutlet var palabraEN: UILabel!
    @IBOutlet var imgEN: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
