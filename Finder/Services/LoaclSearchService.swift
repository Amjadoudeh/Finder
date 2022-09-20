import Foundation
import MapKit
import Combine

class LocalSearchService: ObservableObject {
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    let locationManager = LocationManager()
    var cancellables = Set<AnyCancellable>()
    
    init() {
/// whenever the locationManager will find a location, it will assinge it to the region publisher we have above
        locationManager.$region.assign(to: \.region, on: self)
            .store(in: &cancellables)
    }
}
