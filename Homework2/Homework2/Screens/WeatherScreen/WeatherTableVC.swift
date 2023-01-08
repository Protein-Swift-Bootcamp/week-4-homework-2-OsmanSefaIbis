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
    
    private var weathersList: [List] = []
    private var latitude: String = ""
    private var longitude: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        fetchData()
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
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(Constant.apiRelated.keyAPI)"){
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
                        let decodedResponse = try! JSONDecoder().decode(WeatherInfo.self, from:data)
                        self.weathersList = decodedResponse.list!
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
        return 200
        //        return UITableView.automaticDimension
        
    }
}
extension WeatherTableVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathersList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let weatherCell = tableView.dequeueReusableCell(withIdentifier: "WeatherCellIdentifier", for: indexPath) as! WeatherCell
        
        let tempValue = weathersList[indexPath.row].main?.temp!
        let windValue = weathersList[indexPath.row].wind?.speed!
        let humidityValue = weathersList[indexPath.row].main?.humidity!
        let feelsValue = weathersList[indexPath.row].main?.feelsLike
        
        weatherCell.TempLabel.text = "\(tempValue)"
        weatherCell.HumidityLabel.text = "\(humidityValue)"
        weatherCell.WindLabel.text = "\(windValue)"
        weatherCell.FeltTempLabel.text = "\(feelsValue)"

        return weatherCell
    }
}
extension WeatherTableVC: LabelChangedDelegate{
    func DidChanged(_ city: String?, _ latitude: String?,_ longitude: String?) {
        self.longitude = longitude!
        self.latitude = latitude!
    }
}



