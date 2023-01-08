//
//  WeatherVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 5.01.2023.
//

//
//  PreferenceVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 2.01.2023.
//

import UIKit

class WeatherTableVC: UIViewController {
    
    @IBOutlet weak var WeatherTableView: UITableView!
    
    private var weathers: WeatherInfo!
    
    // FIXME: private let tableViewModel:WeatherResponseModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setTableView()
    }
    
    // MARK: Fetch From API
    func setTableView(){
        WeatherTableView.separatorStyle = .none
        WeatherTableView.delegate = self
        WeatherTableView.dataSource = self
        // custom celli tableview a register etmemiz gerekiyor
        WeatherTableView.register(.init(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCellIdentifier")
    }
    private func fetchData() {
        
        // DELEGATE --> Latitude & Longitude
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=39&lon=32&appid=\(Constant.apiRelated.keyAPI)"){
            var request: URLRequest = .init(url: url)
            request.httpMethod = "GET"
            // Closure içinde background thread e girdik o yüzden tableview reload data yı main threadde çağırmamız gerekiyor
            // URLSession background threadde çalışır
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil{
                    return
                }
                if let data = data{
                    do {
                        let weatherResponseFetch = try? JSONDecoder().decode(WeatherInfo.self, from:data)
                        if let response = weatherResponseFetch{
                            self.weathers = response
                        }
                        // Background threadden UI componentine erişmek istiyorsak Main threade almamız gerekiyor yoksa crash alırız
                        // Apple istiyorki, bütün UI componentleri Main thread içinden çağırmamız lazım --> En önemli UI kuralı
                        DispatchQueue.main.async {
                            self.WeatherTableView.reloadData()
                        }
                    } catch  {
                        print("Decoding Error")
                    }
                    
                }
            }
            task.resume()
        }
        
    }
}
// ***********************************************
// MARK: Protocols
// ***********************************************
extension WeatherTableVC: UITableViewDelegate{
    // Bunlar opsiyonel
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let weather = weathers.main
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension WeatherTableVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let weatherCell = tableView.dequeueReusableCell(withIdentifier: "WeatherCellIdentifier", for: indexPath) as! WeatherCell
        
        if let weathers = weathers,
           let main = weathers.main,
            let temp = main.temp{
            weatherCell.temp.text = String(temp)
            return weatherCell
        }
        else{
            return UITableViewCell()
        }
    }
}



