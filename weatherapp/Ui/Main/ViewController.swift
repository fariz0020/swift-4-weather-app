//
//  ViewController.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtCity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.accessibilityIdentifier = "mainView"
        btnSearch.accessibilityIdentifier = "searchButton"
        txtCity.accessibilityIdentifier = "cityText"
        
        btnSearch.layer.cornerRadius = btnSearch.frame.size.height/4
        btnSearch.layer.masksToBounds = true
        
        btnSearch.setGradientBackground(colorOne: UIColor(rgb: 0x36D1DC), colorTwo: UIColor(rgb: 0x5B86E5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openWeatherPage(city: String) {
        let weatherUI = UIStoryboard(name: StoryboardName.weather, bundle: nil)
        let weatherVC = weatherUI.instantiateViewController(withIdentifier: StoryboardID.weatherStoryboard) as! WeatherViewController
        weatherVC.city = city
        self.present(weatherVC, animated: true, completion: nil)
    }
    
    @IBAction func btnSearchClick(_ sender: Any) {
        if !(txtCity.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            openWeatherPage(city: txtCity.text!)
        }
        let alert = UIAlertController(title: Strings.dialogError, message: Strings.formError, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Strings.STR_OK, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

