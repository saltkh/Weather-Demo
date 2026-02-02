
import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value : String
    var logocolor: Color = .white
    
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title)
                .padding()
                .foregroundColor(Color(hue: 0.64, saturation: 0.853, brightness: 0.451))
                .cornerRadius(25)
                .frame(width: 20 , height: 20)
            
            
            VStack (alignment:  .leading, spacing: 8){
                Text(name)
                    .font(.caption)
            
                Text(value)
                    .bold()
                    .font(.title2)
            }
            
        }
    }
}

#Preview{
    WeatherRow(logo: "?", name: "feelin like" , value: "-100°")
}
