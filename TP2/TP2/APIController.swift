//
//  APIController.swift
//  TP2
//
//  Created by user228865 on 12/9/22.
//

import Foundation

class APIController {
    static public func setWord() {
        let urlString: String = "https://bonhomme.drynish.duckdns.org/getWord"
        guard let url = URL(string: urlString) else {
          print("Error: cannot create URL")
          return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler:
            { (data: Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                print(error)
            }
            
            if let response=response {
                print(response)
            }
            
            if let data=data {
                do {
                    let dataGetWord = try JSONDecoder().decode(DataGetWord.self, from: data)
                    DispatchQueue.main.async {
                        theGame.nextWord = dataGetWord.word.uppercased()
                        theGame.nextSecret = dataGetWord.secret
                    }
                }
                catch{}
            }
        })
        task.resume()
    }
    
    static public func solveWord() {
        
    }
    
    static public func highScore() {
        
    }
}
