//
//  WeatherViewController.swift
//  realWeather
//
//  Created by Szi Gabor on 4/9/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import UIKit
import Alamofire


class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        
    }
    
    
    

   


}

