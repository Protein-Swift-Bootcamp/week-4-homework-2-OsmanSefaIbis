//
//  PreferenceVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 2.01.2023.
//

import UIKit

protocol LabelChangedDelegate: AnyObject{
    func DidChanged(_ city: String?, _ latitude: String?,_ longitude: String?)
}

class PreferenceVC: UIViewController {
    

    @IBOutlet weak var WeatherTableView: UITableView!
    
    @IBOutlet weak var CityTF: UITextField!
    
    @IBOutlet weak var LongitudeTF: UITextField!
    
    @IBOutlet weak var LatitudeTF: UITextField!
    
    private var weatherResponseFetch: WeatherInfo!
    
    weak var delegate: LabelChangedDelegate?

    
    // FIXME: private let tableViewModel:WeatherResponseModel

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SubmitTapped(_ sender: Any) {
        
        delegate?.DidChanged(CityTF.text, LatitudeTF.text, LongitudeTF.text)
        let weatherSB: UIStoryboard = UIStoryboard.init(name: "Weather", bundle: nil)
        if let weatherVC = weatherSB.instantiateViewController(withIdentifier: "WeatherTableVC") as? WeatherTableVC{
            weatherVC.modalPresentationStyle = .fullScreen
            present(weatherVC ,animated: true)
        }
    }
    
    @IBAction func PinMapTapped(_ sender: Any) {
        let pinMapSB: UIStoryboard = UIStoryboard.init(name: "PinMap", bundle: nil)
        let pinmapVC = pinMapSB.instantiateViewController(withIdentifier: "PinMapSB") as! PinMapVC
        
        pinmapVC.modalPresentationStyle = .pageSheet
        present(pinmapVC, animated:true)
    }

}

extension PreferenceVC: LabelChangedDelegate{
    func DidChanged(_ city: String?, _ latitude: String?,_ longitude: String?) {
        CityTF.text = city
        LatitudeTF.text = latitude
        LongitudeTF.text = longitude
    }
}
