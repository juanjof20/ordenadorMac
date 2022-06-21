//
//  MiCelda.swift
//  TablaCiudades
//
//  Created by A1-IMAC08 on 21/12/21.
//

import UIKit

class MiCelda: UITableViewCell
{
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
