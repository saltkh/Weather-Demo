import SwiftUI
import CoreLocationUI

struct welcomeView: View {
    
    @EnvironmentObject var locationManager:
    LocationManager
    
    
    var body: some View {
        VStack{
            VStack(spacing: 20 )
            {
                Text("Welcome")
                    .bold().font(.title)
                
                Text("Share your current location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(40)
            .symbolVariant(.fill)
            .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.968))

        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    welcomeView()
}
