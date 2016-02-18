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
 