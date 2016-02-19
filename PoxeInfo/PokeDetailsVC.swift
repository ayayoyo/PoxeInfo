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
    
    @IBOutlet weak var imgMain: UIImageView!
    
    
    @IBOutlet weak var lblDescriptiom: UILabel!
    
    @IBOutlet weak var lblDefense: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    
    
    @IBOutlet weak var lblHeight: UILabel!
    
    @IBOutlet weak var lblPoxeId: UILabel!
    
    @IBOutlet weak var lblWeight: UILabel!
    
    @IBOutlet weak var lblBaseAttack: UILabel!
    
    @IBOutlet weak var imgEvl: UIImageView!
    
    @IBOutlet weak var lblEvl: UILabel!
    @IBOutlet weak var imgNextEvl: UIImageView!
    var pokemon: Pokemon!
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        lblHeader.text = pokemon.Name
        
    }

    
    @IBAction func BtnBack_Pressed(sender: AnyObject)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
