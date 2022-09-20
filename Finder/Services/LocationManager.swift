import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    // the core location manager
    let locationManager = CLLocationManager()
    @Published var region = MKCoordinateRegion.defaultRegion()
    
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

extension LocationManager:  CLLocationManagerDelegate {
    // to check the status of the Authorization
    private func checkAuthorization() {
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("you have denied the app to access your location")
        case .authorizedAlways, .authorizedWhenInUse:
            print("location")
        @unknown default:
            break
        }
    }
    
    // this func is to check the user did change Authoruzation
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
