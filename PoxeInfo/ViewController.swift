//
//  ViewController.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var CVPokemon: UICollectionView!
    var PokeList = [Pokemon]()
    var FiltertedPokeList = [Pokemon] ()
    var isFilterted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParsePokemonCSV()
    }

    
    func ParsePokemonCSV()
    {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do
        {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows
            {
                 let pokeid =  Int (row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokid: pokeid)
                PokeList.append(poke)
            }
            
        }
        catch let error as NSError
        {
            print(error.description)
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
  
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let pokemon: Pokemon
        if(isFilterted)
        {
            pokemon = FiltertedPokeList [ indexPath.row]
        }
        else
        {
            pokemon = PokeList[indexPath.row]
        }
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokecell", forIndexPath: indexPath) as? PokemonCell
        {
            cell.ConfigureCell(pokemon)
            return cell
        }
        else
        {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if isFilterted
        {
            return FiltertedPokeList.count
        }
        return PokeList.count
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(105.0 , 105.0)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    
    
    
    
    
    
    
    
}

