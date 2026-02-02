import SwiftUI

struct loadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint:.white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    loadingView()
}
