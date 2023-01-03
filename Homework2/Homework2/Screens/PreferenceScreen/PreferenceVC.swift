//
//  PreferenceVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 2.01.2023.
//

import UIKit



class PreferenceVC: UIViewController {

    @IBOutlet weak var CityTF: UITextField!
    
    @IBOutlet weak var LongitudeTF: UITextField!
    
    @IBOutlet weak var LatitudeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func SubmitTapped(_ sender: Any) {
        
    }
    
    @IBAction func PinMapTapped(_ sender: Any) {
        
        let pinMapSB: UIStoryboard = UIStoryboard(name: "PinMap", bundle: nil)
        let pinmapVC = pinMapSB.instantiateViewController(withIdentifier: "PinMapSB") as! PinMapVC
        
        pinmapVC.modalPresentationStyle = .pageSheet
        present(pinmapVC, animated:true)
    }
}
