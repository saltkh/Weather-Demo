import Foundation
import SwiftUI

extension Double{
    func roundDouble() -> String{
        return String(format: "%.0f", self)
    }
}


//for sunset/sunrise
extension Int {
    func formatTimestamp() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.timeStyle = .short 
        return formatter.string(from: date)
    }
}

extension View {
    func  cornerRadius (radius: CGFloat ,corner: UIRectCorner ) -> some View{
        clipShape(RoundedCorner(radius: radius , corners: corner))
    }
    
}

struct RoundedCorner : Shape {
    var radius: CGFloat = .infinity
    var corners:  UIRectCorner = .allCorners
    
    func path (in rect: CGRect)-> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners ,  cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}
