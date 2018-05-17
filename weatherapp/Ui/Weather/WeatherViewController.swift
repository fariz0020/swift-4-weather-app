//
//  WeatherViewController.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/16/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var lblWeatherMain: UILabel!
    @IBOutlet weak var lblWeatherDescription: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblCityCountry: UILabel!
    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var lblAddHumidity: UILabel!
    @IBOutlet weak var lblAddPressure: UILabel!
    @IBOutlet weak var lblAddWind: UILabel!
    @IBOutlet weak var lblAddSunrise: UILabel!
    @IBOutlet weak var lblAddSunset: UILabel!
    @IBOutlet weak var lblAddOtherTemp: UILabel!
    
    @IBOutlet weak var btnSwapTemp: UIButton!
    
    @IBOutlet weak var imvWeatherIcon: UIImageView!
    
    let activityIndicator = UIActivityIndicatorView()
    
    var weatherData = [Weather]()
    
    var temp: Double = 0
    
    // Passing Data
    var city: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if city == nil {
            dismiss(animated: false, completion: nil)
            return
        }
        
        view.accessibilityIdentifier = "weatherView"
        
        setupViews()
        setupDatetime()

        // Do any additional setup after loading the view.
        fetchWeather(city: city!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        setNavigationBar()
        
        // setup activity indicator
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        self.view.addSubview(activityIndicator)
        
        // setup empty label
//        emptyLabelView.isHidden = true
    }
    
    func setupDatetime() {
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        lblDatetime.text = formatter.string(from: currentDateTime)
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: Strings.APP_NAME)
        let doneItem = UIBarButtonItem(title: "\u{25C0}", style: .plain, target: self, action: #selector(done))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() { // remove @objc for Swift 3
        dismiss(animated: true, completion: nil)
    }
    
    func showLoading(isShow: Bool) {
        if (isShow) {
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        }else {
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func fetchWeather(city: String) {
        showLoading(isShow: true)

        Api.fetchWeather(city: city, completion: { (result) in
            switch result {
            case .success(let response):
                self.setupWeather(response: response)
                
                self.showLoading(isShow: false)
            case .failure(let error):
                print(error)
                self.showLoading(isShow: false)
            }
        })
    }
    
    func setupWeather(response: WeatherResponse) {
        print(response)
        
        // setup temperature & city header
        temp = (response.main?.temp)!
        self.lblTemperature.text = String(format: "%.0fº C", (response.main?.temp)!)
        self.lblCityCountry.text = String(format: "%@, %@ %@", city!, IsoCountryCodes.find(key: (response.sys?.country)!).name, IsoCountries.flag(countryCode: (response.sys?.country)!))
        
        // setup image icon
        weatherData = response.weather!
        if let iconName = weatherData[0].icon {
            let url = ApiConstant.EndPoint.baseIconUrl + iconName + ".png"
            imvWeatherIcon.downloadedFrom(url: URL(string: url)!)
        }
        // setup weather condition
        self.lblWeatherMain.text = response.weather![0].main
        self.lblWeatherDescription.text = response.weather![0].description
        
        // setup additional info condition
        self.lblAddHumidity.text = String(format: "%.0f %", (response.main?.humidity)!)
        self.lblAddPressure.text = String(format: "%.0f hPa", (response.main?.pressure)!)
        self.lblAddWind.text = String(format: "%.0f m/s", (response.wind?.speed)!)
        
        self.lblAddSunrise.text = TimestampUtils.timestampToTime(timestamp: response.sys?.sunrise)
        self.lblAddSunset.text = TimestampUtils.timestampToTime(timestamp: response.sys?.sunset)
        self.lblAddOtherTemp.text = String(format: "%.0fº F", (((response.main?.temp)! * 9/5)) + 32)
    }
    
    @IBAction func swapTemperature(_ sender: UIButton) {
        if lblTemperature.text?.range(of: "C") != nil {
            lblTemperature.text = String(format: "%.0fº F", ((temp * 9/5)) + 32)
            lblAddOtherTemp.text = String(format: "%.0fº C", temp)
        } else {
            lblAddOtherTemp.text = String(format: "%.0fº F", ((temp * 9/5)) + 32)
            lblTemperature.text = String(format: "%.0fº C", temp)
        }
    }
}
