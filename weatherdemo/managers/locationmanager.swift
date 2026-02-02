import Foundation
import CoreLocation

class LocationManager: NSObject , ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager ()
     
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isloading = false

    override init()
    {
        super.init()
        manager.delegate = self
    }

    func requestLocation(){
        isloading = true
        manager.requestLocation()
//        this is very slow
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
     
        location = locations.first?.coordinate
        isloading=false
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("couldn't get location", error)
        isloading=false 
    }
}
