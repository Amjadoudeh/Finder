import SwiftUI
import MapKit


struct ContentView: View {
    @State var search: String = ""
    
    var body: some View {
        VStack {
            //MARK: the Search Bar
           TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    // search nearby places
                }
                .padding()
            //MARK: the list of the places
            List(1...20, id: \.self) { index in
                Text("\(index)")
            }
            Spacer()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
