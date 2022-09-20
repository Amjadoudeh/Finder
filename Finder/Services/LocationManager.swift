import Foundation
import CoreLocation

class LoactionManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    // the core location manager
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // need the filter to limit the location changes update .. 200 meter or less
        locationManager.distanceFilter = kCLHeadingFilterNone
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
}
