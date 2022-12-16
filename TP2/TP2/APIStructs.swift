//
//  APIStructs.swift
//  TP2
//
//  Created by user228865 on 12/14/22.
//

import Foundation

struct DataGetWord : Decodable {
    var word : String;
    var secret : String;
}

struct DataHighScore : Decodable {
    var player : String
    var score : String
}
