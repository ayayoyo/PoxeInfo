//
//  ViewController.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate
{

    @IBOutlet weak var CVPokemon: UICollectionView!
    @IBOutlet weak var SrchBarSearchPoke:UISearchBar!
    
    
    
    var PokeList = [Pokemon]()
    var FiltertedPokeList = [Pokemon] ()
    var isFilterted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SrchBarSearchPoke.returnKeyType = UIReturnKeyType.Done
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
        let poke: Pokemon!
        if isFilterted
        {
            poke = FiltertedPokeList[indexPath.row]
        }
        else
        {
            poke = PokeList[indexPath.row]
        }
        
        performSegueWithIdentifier("PokeDetailSegue", sender: poke)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        if  searchText == ""
        {
            isFilterted = false
            view.endEditing(true)
            CVPokemon.reloadData()
        }
        else
        {
            isFilterted = true
            let lower = searchText.lowercaseString
            FiltertedPokeList = PokeList.filter({$0.Name.rangeOfString(lower) != nil})
            CVPokemon.reloadData()
        }
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "PokeDetailSegue"
        {
            if let detailvc = segue.destinationViewController as? PokeDetailsVC
            {
                if let poke = sender as?Pokemon
                {
                    detailvc.pokemon = poke
                }
                
            }
        }
    }
    
}



















