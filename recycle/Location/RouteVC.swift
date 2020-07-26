//
//  RouteVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/24/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import UserNotifications

class RouteVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    public var coordinater: [customIn] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer =  MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            render(location)
        }
    }
     func render(_ location: CLLocation){
        
         let count = coordinater.count - 2
        var counter = 0
        for i in 1...count{
            let location1 = coordinater[i]
            let location2 = coordinater[i+1]
            self.mapView.addAnnotation(location1)
            self.mapView.addAnnotation(location2)
            let sourcePlaceMarker = MKPlacemark(coordinate: coordinater[i].coordinate)
            let destinationPlaceMarker = MKPlacemark(coordinate: coordinater[i+1].coordinate)
            let directionsRequest = MKDirections.Request()
            directionsRequest.source = MKMapItem(placemark: sourcePlaceMarker)
            directionsRequest.destination = MKMapItem(placemark: destinationPlaceMarker)
            directionsRequest.transportType = .automobile
            
            let direction = MKDirections(request: directionsRequest)
            direction.calculate{(response, error) in
                guard let directionResponse = response else{
                    if let error = error{
                        print("error")
                    }
                    return
                }
                let router = directionResponse.routes[0]
                let apple = router.expectedTravelTime
                let banana = Int(apple / 60)
                
                counter = counter + banana
                self.mapView.addOverlay(router.polyline, level: .aboveRoads)
                let rect = router.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
     }
    
    @IBAction func cancelBtnPrssed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startRoutePressed(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        {(granted, error) in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "The driver has started driving"
        content.body = "Please get your items ready"
        
        let date = Date() + 5
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        center.add(request){ (error) in
            
        }
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
