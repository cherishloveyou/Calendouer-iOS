//
// CalViewController.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import CoreLocation


class CalViewController: UIViewController {
    
    let bakView: UIView = {
        let bakView: UIView = UIView()
        bakView.backgroundColor = RGBA(r: 76, g: 175, b: 80, a: 1)
        bakView.layer.shadowColor = UIColor.gray.cgColor
        bakView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bakView.layer.shadowOpacity = 0.4
        bakView.layer.shadowRadius = 2
        return bakView
    }()
    
    let monthLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "--"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weekdayLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "---"
        _label.textColor = .white
        _label.textAlignment = .center
        _label.font = DouDefalutFont
        return _label
    }()
    let weekdayView: UIView = UIView()
    
    let lunarLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "--------"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        _label.sizeToFit()
        return _label
    }()
    
    let dayLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "0"
        _label.textColor = .white
        _label.textAlignment = .center
        _label.font = DouCalendarFont
        _label.sizeToFit()
        return _label
    }()
    
    let cityLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "--"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        return _label
    }()
    
    let updateTimeLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "更新：--"
        _label.textColor = .white
        _label.textAlignment = .right
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weatherLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "--"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let degreeLabel: UILabel = {
        let _label: UILabel = UILabel()
        _label.text = "--"
        _label.textColor = .white
        _label.textAlignment = .left
        _label.font = DouDefalutFont
        return _label
    }()
    
    let weatherImageView: UIImageView = {
        let _imageView: UIImageView = UIImageView(image: UIImage(named: "cloudy"))
        _imageView.contentMode = .scaleAspectFit
        return _imageView
    }()
    
    var tableView: UITableView = UITableView()
    
    // Location Manager
    let locationManager: CLLocationManager = CLLocationManager()
    var lock = NSLock()
    var currentLocation: CLLocation = CLLocation()
    
    // Process Manger
    let process: ProcessManager = ProcessManager()
    var cardData: [NSObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        addViews()
        settingLayout()
        setupData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if CLLocationManager.authorizationStatus() == .denied {
            
        } else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    
    private func initialView() {
        view.backgroundColor = DouBackGray
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tableView.backgroundColor = DouBackGray
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: CardTableViewCellId, bundle: nil), forCellReuseIdentifier: CardTableViewCellId)
        
        // Core Location
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10000
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        
    }
    
    private func addViews() {
        view.addSubview(tableView)
        view.addSubview(bakView)
        bakView.addSubview(monthLabel)
        bakView.addSubview(weekdayView)
        bakView.addSubview(weekdayLabel)
        bakView.addSubview(lunarLabel)
        bakView.addSubview(dayLabel)
        bakView.addSubview(cityLabel)
        bakView.addSubview(weatherLabel)
        bakView.addSubview(degreeLabel)
        bakView.addSubview(updateTimeLabel)
        bakView.addSubview(weatherImageView)
    }
    
    private func setupData() {
        self.process.GetDay(Switch: true) { (day) in
            self.monthLabel.changeText(data: day.getMonth())
            self.weekdayLabel.changeText(data: day.getWeekDay())
            self.lunarLabel.changeText(data: day.getLunnerDay())
            self.dayLabel.changeText(data: day.getDay())
        }
        
        self.process.GetMovie(Switch: true) { (movie) in
            self.cardData.append(movie)
            self.tableView.reloadData(animated: true)
        }
    }
    
    private func settingLayout() {
        bakView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(260)
        }
        monthLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bakView.snp.left).offset(60)
            make.top.equalTo(bakView.snp.top).offset(42)
        }
        lunarLabel.snp.makeConstraints { (make) in
            make.right.equalTo(bakView.snp.right).offset(-60)
            make.centerY.equalTo(monthLabel)
        }
        weekdayView.snp.makeConstraints { (make) in
            make.left.equalTo(monthLabel.snp.right)
            make.right.equalTo(lunarLabel.snp.left)
            make.centerY.equalTo(monthLabel)
            make.height.equalTo(20)
        }
        weekdayLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(weekdayView)
            make.centerY.equalTo(monthLabel)
        }
        dayLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bakView)
            make.top.equalTo(weekdayLabel.snp.bottom).offset(15)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dayLabel.snp.bottom)
            make.right.equalTo(view.snp.right).offset(-222)
        }
        updateTimeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(cityLabel.snp.right)
            make.top.equalTo(cityLabel.snp.bottom).offset(15)
        }
        weatherLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cityLabel)
            make.left.equalTo(view.snp.left).offset(222)
        }
        degreeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(updateTimeLabel)
            make.left.equalTo(weatherLabel)
        }
        weatherImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(dayLabel)
            make.height.equalTo(40)
            make.bottom.equalTo(updateTimeLabel.snp.bottom)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(bakView.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
            make.right.equalTo(view.snp.right)
        }
    }
}

extension CalViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardData.count
    }
}

extension CalViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardTableViewCell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCellId, for: indexPath) as! CardTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if cardData.count > 0 {
            if cardData[indexPath.row].classForCoder == MovieObject.self {
                let movie: MovieObject = self.cardData[indexPath.row] as! MovieObject
                cell.movie = movie
            }
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CalViewController: UIScrollViewDelegate {
    @available(iOS 2.0, *)
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y > 0) {
            let c: Float = 0.01
            if self.bakView.layer.shadowOpacity <= 0.8 {
                self.bakView.layer.shadowOpacity = 0.4 + Float(scrollView.contentOffset.y) * c
            }
        } else {
            self.bakView.layer.shadowOpacity = 0.4
        }
    }
}

// Core Location
extension CalViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lock.lock()
        if let currentLocation = locations.last {
            print("\(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
            let geocoder: CLGeocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(currentLocation, completionHandler: { (place, error) in
                if place != nil {
                    if let city = place?.last {
                        // 暂时更改 UI 方法
                        // TODO: 通用方法修改视图回调接口
                        self.cityLabel.changeText(data: city.locality!)
                        let la = currentLocation.coordinate.latitude
                        let lo = currentLocation.coordinate.longitude
                        self.process.GetWeather(Switch: true, latitude: CGFloat(la), longitude: CGFloat(lo), handle: { (weather) in
                            self.degreeLabel.changeText(data: "\(weather.low)°C | \(weather.high)°C")
                            self.weatherLabel.changeText(data: "\(weather.text_day)，\(weather.text_night)")
                            self.updateTimeLabel.changeText(data: "更新：\(weather.last_update)")
                            self.weatherImageView.image = UIImage(named: weather.getWeatherIcon())
                        })
                    }
                }
            })
        }
        lock.unlock()
    }
}
