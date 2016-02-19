//
//  PokeDetailsVC.swift
//  PoxeInfo
//
//  Created by Aya on 2/18/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import UIKit

class PokeDetailsVC: UIViewController {

    
    @IBOutlet weak var lblHeader: UILabel!
    
    var pokemon: Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblHeader.text = pokemon.Name
        
    }

      
}
