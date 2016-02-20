//
//  Pokemon.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon
{
    private var _Name: String!
    private var _PokeId: Int!
    private var _Description: String!
    private var _Type: String!
    private var _Defense: String!
    private var _Height: String!
    private var _Weight: String!
    private var _Attack: String!
    private var _NextEvlTxt: String!
    private var _NextEvlId: String!
    private var _NextEvlLvl: String!
    
    private var _PokeURL: String!
    
    
    var Name: String
        {
        get
        {
            return _Name
        }
    }
    var PokeId: Int
        {
        get
        {
            return _PokeId
        }
    }

    
    var Type: String
    {
        get
        {
            if _Type == nil
            {
                return ""
            }
            return _Type
        }
    }
    var Attack: String
        {
        get
        {
            if _Attack == nil
            {
                return ""
            }
            return _Attack
        }
    }
    
    var Defense: String
    {
        get
        {
            if _Defense == nil
            {
                return ""
            }
            return _Defense
        }
    }
    
    var Height: String
    {
        get
        {
            if _Height == nil
            {
                return ""
            }
            return _Height
        }
    }
    
    var Weight: String
    {
        get
        {
            if _Weight == nil
            {
                return ""
            }
            return _Weight
        }
    }
    
    
    var PokeDescription: String
    {
        get
        {
            if _Description == nil
            {
                return ""
            }
            return _Description
        }
    }
    
    
    var NextEvlTxt: String
    {
        get
        {
            if _NextEvlTxt == nil
            {
                return ""
            }
            return _NextEvlTxt
        }
    }
    
    var NextEvlId: String
    {
        get
        {
            if _NextEvlId == nil
            {
                return ""
            }
            return _NextEvlId
        }
    }
    var NextEvlLvl: String
    {
        get
        {
            if _NextEvlLvl == nil
            {
                return ""
            }
            return _NextEvlLvl
        }
    }
    
    
    
    init(name: String , pokid: Int)
    {
        _Name = name
        _PokeId = pokid
        _PokeURL = "\(URL_BASE)\(URL_POKEMON)\(PokeId)"
    }
    func DownloadPokemon (completed: DownloadCompleted)
    {
        
        let url = NSURL(string: self._PokeURL)!
        Alamofire.request(.GET, url).responseJSON { (response:Response<AnyObject, NSError>) -> Void in
            
            let result = response.result
            if let dic = result.value as? Dictionary<String , AnyObject>
            {
                if let weight = dic["weight"] as? String
                {
                    self._Weight = weight
                }
                
                if let height = dic["height"] as? String
                {
                    self._Height = height
                }
                
                if let defense = dic["defense"] as? Int
                {
                    self._Defense = "\(defense)"
                }
                
                if let attack = dic["attack"] as? Int
                {
                    self._Attack = "\(attack)"
                }
                
                if let types = dic["types"] as? [Dictionary <String , String>] where types.count > 0
                {
                    if let name = types[0]["name"]
                    {
                        self._Type = name
                    }
                    if types.count > 1
                    {
                        for var i = 1 ; i < types.count ; i++
                        {
                            if let name = types[i]["name"]
                            {
                                self._Type! += "/\(name)"
                            }
                        }
                    }
                }
                else
                {
                    self._Type = ""
                }
                
                if let evolution = dic["evolutions"] as? [Dictionary<String , AnyObject>] where evolution.count > 0
                {
                    if let to = evolution[0]["to"] as? String
                    {
                        if to.rangeOfString("mega") == nil
                        {
                            self._NextEvlTxt = to
                            
                            if let lvl = evolution[0]["level"] as? Int
                            {
                                self._NextEvlLvl = "\(lvl)"
                            }
                            
                            if let url = evolution[0]["resource_uri"] as? String
                            {
                                let str = url.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = str.stringByReplacingOccurrencesOfString("/", withString: "")
                                self._NextEvlId = num
                                
                            }
                        }
                    }
                }
                
                
                if let desc = dic["descriptions"] as? [Dictionary <String , String>] where desc.count > 0
                {
                    if let descURL = desc[0]["resource_uri"]
                    {
                        if let url = NSURL(string: "\(URL_BASE)\(descURL)")
                        {
                            Alamofire.request(.GET, url).responseJSON(completionHandler: { (descResponse:Response<AnyObject, NSError>) -> Void in
                                
                                let res = descResponse.result
                               if let DescDict = res.value as? Dictionary<String , AnyObject>
                               {
                                    if let PokeDesc = DescDict["description"] as? String
                                    {
                                        self._Description = PokeDesc
                                       
                                    }
                                }
                                completed()                                
                            })
                        }
                        
                    }
                    
                }
                else
                {
                    self._Description = ""
                }
               
            }
            
        }
    }
        
    
}

 