//
//  PokemonCell.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell
{
    @IBOutlet weak var lblPokeName: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        
    }
    
    func ConfigureCell(pokemon: Pokemon)
    {
        lblPokeName.text = pokemon.Name.capitalizedString
        imgPoke.image = UIImage(named: "\(pokemon.PokeId)")
    }
}
