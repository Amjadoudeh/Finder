import Foundation
import MapKit

extension MKCoordinateRegion {
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    }
}
