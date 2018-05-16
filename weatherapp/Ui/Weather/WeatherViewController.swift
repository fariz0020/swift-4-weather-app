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
    
    let activityIndicator = UIActivityIndicatorView()
    
    var weatcher = [Weather]()
    
    // Passing Data
    var city: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if city == nil {
            dismiss(animated: false, completion: nil)
            return
        }
        
        setupViews()

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
                print(response)
                self.showLoading(isShow: false)
            case .failure(let error):
                print(error)
                self.showLoading(isShow: false)
            }
        })
    }
}
