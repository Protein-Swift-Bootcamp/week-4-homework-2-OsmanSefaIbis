//
//  ViewController.swift
//  Homework2
//
//  Created by Sefa İbiş on 27.12.2022.
//
// Open Weather API key = 2eac594a9ba3865e5c80d19c4121b4b7


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    let scheme = "https://"
    let domain = "api.openweathermap.org"
    let path = "/data/2.5/weather?"
    // Ankara Longitude & Latitude
    let queryString = "lat=39&lon=32&appid="
    
    let apiKey = "f8708e254a1b04be6a558aec4cc658f3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Open Weather API"
    }
    
    
    @IBAction func getButtonTapped(_ sender: Any) {
        
        let url = URL(string:
                scheme + domain + path + queryString + apiKey
        )
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data,response, error in
            if error != nil{
                print("error")
            }else{
                if data != nil{
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        DispatchQueue.main.async {
                            if let main = jsonResponse!["main"] as? [String:Any] {
                                if let temp = main["temp"] as? Double {
                                    self.currentTempLabel.text = String(self.kelvinToCelcius(kelvin: temp))
                                }
                                if let feels = main["feels_like"] as? Double{
                                    self.feelsLikeLabel.text = String(self.kelvinToCelcius(kelvin: feels))
                                }
                            }
                            if let wind = jsonResponse!["wind"] as? [String:Any]{
                                if let speed = wind["speed"] as? Double{
                                    self.windSpeedLabel.text = String(Int(speed))
                                }
                            }
                        }
                    }catch{
                        
                    }
                }
            }
        }
        task.resume()
        
    }
    func kelvinToCelcius(kelvin : Double) -> (Int){
        var celcios = kelvin - 273.15
        return Int(celcios)
    }
    
}

