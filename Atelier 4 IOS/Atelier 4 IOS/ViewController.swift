//
//  ViewController.swift
//  Atelier 4 IOS
//
//  Created by user228865 on 11/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getWeather()
    }
    

    func getWeather() {
        let session = URLSession.shared
        
        let weatherURL = URL( string: "http://api.openweathermap.org/data/2.5/weather?q=Atlanta,us?&units=imperial&APPID=17376a9441357c52f3e60c736816e948")!
        
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                self.labMessage.text = "Error:\n\(error)"
            } else {
                if let data = data {
                    
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    self.labMessage.text = "All the weather data:\n\(dataString!)"
                    
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        
                        if let mainDictionary = jsonObj.value(forKey: "main") as? NSDictionary {
                            if let temperature = mainDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    self.labMessage.text = "Atlanta Temperature: \(temperature)°F"
                                }
                            }
                        } else {
                            self.labMessage.text = "Error: unable to find temperature in dictionary"
                        }
                    } else {
                        self.labMessage.text = "Error: unable to convert json data"
                    }
                } else {
                    self.labMessage.text = "Error: did not receive data"
                }
            }
        }
        
        dataTask.resume()
    }

}

