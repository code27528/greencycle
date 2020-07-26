//
//  LocationMenuVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/24/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class customIn: NSObject, MKAnnotation{
    var coordinate : CLLocationCoordinate2D
    var describer: String
    init(location:CLLocationCoordinate2D, description: String){
        self.coordinate = location
        self.describer = description
    }
}


class LocationMenuVC: UIViewController, CLLocationManagerDelegate {
            
    @IBOutlet weak var cashButton: UIButton!
    @IBOutlet weak var wasteButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var pickupButton: UIButton!
    @IBOutlet weak var routeButton: UIButton!
    
    //creates array of locations and sets up map view
    public var coordinates: [customIn] = []
    let manager = CLLocationManager()
    var userCoord: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //modifies buttons and sets up map view further
        cashButton.layer.cornerRadius = 8
        wasteButton.layer.cornerRadius = 8
        otherButton.layer.cornerRadius = 8
        pickupButton.layer.cornerRadius = 8
        routeButton.layer.cornerRadius = 8
        coordinates = createArray()
        self.manager.requestAlwaysAuthorization()
        self.manager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    //passes data forward in the view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecurityVC{
            let vc = segue.destination as? SecurityVC
            vc?.coordinate = coordinates
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userCoord = locValue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    //creates array of locations
    func createArray() -> [customIn]{
        var tempArray: [customIn] = []
        
        let location1 = customIn(location: CLLocationCoordinate2D(latitude: 37.32365, longitude: -122.009999), description: "Location 1")
        let location2 = customIn(location: CLLocationCoordinate2D(latitude: 37.35231, longitude: -121.96044), description: "Location 2")
        let location3 = customIn(location: CLLocationCoordinate2D(latitude: 37.32297, longitude: -122.03618), description: "Location 3")
        let location4 = customIn(location: CLLocationCoordinate2D(latitude: 37.37446, longitude: -122.03208), description: "Location 4")
        tempArray.append(location4)
        tempArray.append(location2)
        tempArray.append(location1)
        tempArray.append(location3)

        return tempArray
    }
    
    @IBAction func recyclePressed(_ sender: Any) {
        performSegue(withIdentifier: "cashMapSegue", sender: self)
    }
    
    @IBAction func wastePressed(_ sender: Any) {
        performSegue(withIdentifier: "wasteMapSegue", sender: self)
    }
    @IBAction func otherPressed(_ sender: Any) {
        performSegue(withIdentifier: "otherSegue", sender: self)
    }
    @IBAction func pickUpSchedule(_ sender: Any) {
        if let x = userCoord{
            coordinates.append(customIn(location: x, description: "Final Location"))
        }
        let alert = UIAlertController(title: "Pickup scheduled!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true)

    }
    
    @IBAction func pickupRoute(_ sender: Any) {
        performSegue(withIdentifier: "securitySegue", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
