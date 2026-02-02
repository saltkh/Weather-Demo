import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @State private var showDetails = true // so we can add pull up
    
    var weatherIcon: String {
        switch weather.weather[0].main.lowercased() {
        case "clouds":
            return "cloud.fill"
        case "clear":
            return "sun.max.fill"
        case "rain":
            return "cloud.rain.fill"
        case "thunderstorm":
            return "cloud.bolt.fill"
        case "snow":
            return "snow"
        case "fog", "mist":
            return "cloud.fog.fill"
        default:
            return "questionmark.circle"
        }
        
    }
    
    var weatherImageURL: String {
        switch weather.weather[0].main.lowercased() {
        case "clouds":
            return "https://static.vecteezy.com/system/resources/thumbnails/024/683/472/small/3d-icon-cloudy-weather-forecast-illustration-concept-icon-render-png.png"
        case "clear":
            return "https://s3-alpha.figma.com/hub/file/2803345406/df2a8280-b65b-49da-b706-bed599bf2e0b-cover.png"
        case "rain":
            return "https://static.vecteezy.com/system/resources/thumbnails/012/806/409/small_2x/3d-cartoon-weather-rain-sign-of-dark-clouds-with-raindrops-isolated-on-transparent-background-3d-render-illustration-png.png"
        case "thunderstorm":
            return "https://static.vecteezy.com/system/resources/thumbnails/008/854/791/small/thunderstorm-rain-icon-weather-forecast-meteorological-sign-3d-render-png.png"
        case "snow":
            return "https://static.vecteezy.com/system/resources/thumbnails/012/806/416/small/3d-cartoon-weather-icon-snow-clouds-and-snowflakes-sign-isolated-on-transparent-background-3d-render-illustration-png.png"
        case "fog", "mist":
            return "https://static.vecteezy.com/system/resources/thumbnails/028/051/914/small/3d-rendering-dust-isolated-useful-for-food-allergen-allergy-disease-and-antigen-design-element-png.png"
        default:
            
            return "https://cdn-icons-png.freepik.com/256/10246/10246012.png?semt=ais_white_label"
        }
    }
    
    
    
    
    
    var weatherDetailsPullUp: some View {
        VStack(alignment: .leading , spacing: 20){
            Text("Weather Details")
                .bold().padding(.bottom)
            ScrollView {
                VStack (spacing: 20 ){
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Mini-Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max-Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "gauge.with.needle", name: "Pressure", value: (weather.main.pressure.roundDouble() + "hPa"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s") )
                        Spacer()
                        WeatherRow(logo: "safari", name: "Wind direction", value: (weather.wind.deg.roundDouble() + "°" ))
                        
                    }
                    
                    HStack {
                        WeatherRow(logo: "sunrise.fill", name: "Sunrise", value: (weather.sys.sunrise.formatTimestamp() ))
                        Spacer()
                        WeatherRow(logo: "sunset.fill", name: "Sunset", value: (weather.sys.sunset.formatTimestamp() ))
                    }
                }
            }
//            }.frame(maxHeight: 150)
            
        }.frame(maxWidth: .infinity , alignment:  .leading)
            .padding()
            .padding(.bottom,20)
            .foregroundColor(Color(hue: 0.64, saturation: 0.853, brightness: 0.451))
            .background(.white)
            .cornerRadius(radius: 20, corner: [.topLeft ,.topRight])
        
    }
    
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: /*.leading*/ .center , spacing: 7){
                    Text(weather.name)
                        .bold().font(.title)
                        .multilineTextAlignment(.center)
                    Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))") .fontWeight(.light)
                    
                }.frame(maxWidth: .infinity , alignment: /*.leading*/ .center)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: weatherIcon) //check and set symbol next
                                .font(.system(size: 30))
                            
                            Text(weather.weather[0].main)
            
                        }.frame(width: 150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .fontWeight(.bold)
                            .font(.system(size:60))
                            .padding()
                    }
                    
                    Spacer().frame(height:2)
                     
                    AsyncImage(url: URL(string: weatherImageURL )) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300)
                    } placeholder: {
                        ProgressView()
                    }

                Spacer()
                
                }.frame(maxWidth: .infinity)
                 
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
        
            VStack{
                Spacer()
   
            }

        }
        .background(Color(hue: 0.64, saturation: 0.853, brightness: 0.451) )
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $showDetails) {
            weatherDetailsPullUp
                .presentationDetents([.height(250), .large]) // full screen, low height
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled() // so it wont close entirely
        }
    }
}

#Preview {
    WeatherView(weather:  previewWeather)

}

