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
    
    func search(query: String) {
        ///A utility object for initiating map-based searches and processing the results.
        let requset = MKLocalSearch.Request()
        /// A string containing the desired search item.
        requset.naturalLanguageQuery = query
        /// we only want to provide data for this region
        requset.region = locationManager.region
        
        /// Create a search request
        let search = MKLocalSearch(request: requset)
        search.start { response , error in
            if let response = response {
                let mapItems = response.mapItems
            }
        }
    }
}
