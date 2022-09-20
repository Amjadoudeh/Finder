import Foundation
import MapKit

struct ModelMark: Identifiable, Hashable {
    let placemark: MKPlacemark
    let id = UUID()
    var name: String {
        self.placemark.name ?? ""
    }
    var title: String {
        self.placemark.title ?? ""
    }
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
