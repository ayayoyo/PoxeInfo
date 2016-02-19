//
//  Pokemon.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import Foundation

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
    
    init(name: String , pokid: Int)
    {
        _Name = name
        _PokeId = pokid
    }

    
}
 