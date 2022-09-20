import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ?  Color.secondary : Color.primary)
            
            TextField("Search by name of symbol", text: $searchText)
                .foregroundColor(Color.primary)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.primary)
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0 : 1.0)
                        .onTapGesture {
                        //    UIApplication.shared.endEditing()
                            searchText = ""
                        },
                    alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.primary.opacity(0.15),
                        radius: 10
                        )
        )
        .padding()
    }
        
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
           
            SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        }
    }
}

