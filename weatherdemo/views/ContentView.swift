import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    let weatherManager = WeatherManager()
    @State var weather: ResponseBody? 
     
    var body: some View {
        VStack {
               
            
              if let location = locationManager.location{
                  if let weather = weather{
                      WeatherView(weather: weather)
 
                  } else{
                      loadingView()
                          .task{
                              do{
                                  weather=try await
                                  weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                              }catch {
                                  print("error\(error)")
                              }
                          }
                  }
//                    Text("Your coordinates are:")
//                  Text("Lat: \(location.latitude, specifier: "%.2f"), Lon: \(location.longitude, specifier: "%.2f")")

                  
              } else {
                  if locationManager.isloading{
                      loadingView()
                  } else {
                      welcomeView()
                          .environmentObject(locationManager)
                  }
              }
        }
        .background(Color(hue: 0.64, saturation: 0.853, brightness: 0.451) )
//        .background(Color(hue: 0.583 , saturation: 0.96, brightness: 0.88) )
        .preferredColorScheme(.dark)
    }
} 

#Preview {
    ContentView()
}
