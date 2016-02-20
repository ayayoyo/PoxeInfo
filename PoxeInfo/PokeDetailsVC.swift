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

        lblHeader.text = pokemon.Name.capitalizedString
        let img = UIImage (named: "\(pokemon.PokeId)")
        imgMain.image = img
        imgEvl.image = img
        lblPoxeId.text = "\(pokemon.PokeId)"
        
        pokemon.DownloadPokemon { () -> () in
            
           self.UpdateUI()
            
        }
        
    }

    func UpdateUI()
    {
       
        self.lblDescriptiom.text = pokemon.PokeDescription
       
        self.lblDefense.text = self.pokemon.Defense
        self.lblHeight.text = self.pokemon.Height
        self.lblWeight.text = self.pokemon.Weight
        self.lblType.text = self.pokemon.Type
        lblBaseAttack.text = pokemon.Attack
        
        
        if  pokemon.NextEvlId == ""
        {
            lblEvl.text = "No Evolution"
            imgNextEvl.hidden = true
        }
        else
        {
            imgNextEvl.hidden = false
            var str = "Next Evolution: \(self.pokemon.NextEvlTxt)"
            self.imgNextEvl.image = UIImage (named: self.pokemon.NextEvlId)
            
            if pokemon.NextEvlLvl != ""
            {
                str += " - LVL \(pokemon.NextEvlLvl)"
            }
            
            lblEvl.text = str
        }
       
    }
    
    @IBAction func BtnBack_Pressed(sender: AnyObject)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
